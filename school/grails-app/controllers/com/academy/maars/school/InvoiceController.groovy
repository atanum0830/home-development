package com.academy.maars.school



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import groovy.time.TimeCategory

@Transactional(readOnly = true)
class InvoiceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def assetResourceLocator;
    def pdfRenderingService;

    def renderPdf(Invoice invoiceInstance) {
        Student student = invoiceInstance.student;
        Parent parent = student.parent;
        def schedules = invoiceInstance.schedules.sort { it.id }
        def miscItems = invoiceInstance.miscItems.sort { it.id }

        response.contentType = 'application/pdf'
        response.setHeader("Content-disposition", "attachment; filename=\"invoice.pdf\"")

        renderPdf(
            template: '/mail/invoiceTemplate', 
            model: [invoice: invoiceInstance, student:student, parent:parent, schedules:schedules,
                    miscItems:miscItems, rl:assetResourceLocator, docType:'PDF'], 
            filename: "invoice.pdf")
    }

    def sendEmail(Invoice invoiceInstance) {
        Student student = invoiceInstance.student;
        Parent parent = student.parent;
        def schedules = invoiceInstance.schedules.sort { it.id }
        def miscItems = invoiceInstance.miscItems.sort { it.id }

        ByteArrayOutputStream bytes = pdfRenderingService.render(
                                template: '/mail/invoiceTemplate', 
                                model: [invoice: invoiceInstance, student:student, parent:parent,
                                        schedules:schedules, miscItems:miscItems, rl:assetResourceLocator,
                                        docType:'PDF'])

        sendMail {
            multipart true
            to parent.email
            subject "INVOICE"
            html g.render(
                template:'/mail/invoiceTemplate', 
                model:[invoice:invoiceInstance, student:student, parent:parent,
                        schedules:schedules, miscItems:miscItems, docType:'EMAIL'])

            attachBytes "studentInvoice.pdf", "application/pdf", bytes.toByteArray()
        }
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Invoice.list(params), model:[invoiceInstanceCount: Invoice.count()]
    }

    def unpaid(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.sort = 'id';

        def resuts = Invoice.findAllByIsPaid(false, params);
        def count = Invoice.countByIsPaid(false, params);        

        respond resuts, model:[invoiceInstanceCount: count], view:'index'
    }

    def curMonth(Integer max) {
        def startDate = DateUtils.findCurMonthStartDate();
        def endDate = DateUtils.findCurMonthEndDate();

        handleMonth(max, startDate, endDate);
    }

    def nextMonth(Integer max) {
        def startDate = DateUtils.findNextMonthStartDate();
        def endDate = DateUtils.findNextMonthEndDate();
        
        handleMonth(max, startDate, endDate);
    }

    def prevMonth(Integer max) {
        def startDate = DateUtils.findPrevMonthStartDate();
        def endDate = DateUtils.findPrevMonthEndDate();
        
        handleMonth(max, startDate, endDate);
    }

    def show(Invoice invoiceInstance) {
        def schedules = invoiceInstance.schedules.sort { it.id }
        def miscItems = invoiceInstance.miscItems.sort { it.id }
        //invoiceInstance.schedules.sort { it.id }
        //invoiceInstance.miscItems.sort { it.id }
        invoiceInstance.schedules = schedules
        invoiceInstance.miscItems = miscItems
        respond invoiceInstance
    }

    def create() {
        respond new Invoice(params)
    }

    @Transactional
    def save(Invoice invoiceInstance) {
        if (invoiceInstance == null) {
            notFound()
            return
        }

        if (invoiceInstance.hasErrors()) {
            respond invoiceInstance.errors, view:'create'
            return
        }

        invoiceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'invoice.label', default: 'Invoice'), invoiceInstance.id])
                redirect invoiceInstance
            }
            '*' { respond invoiceInstance, [status: CREATED] }
        }
    }

    def edit(Invoice invoiceInstance) {
        respond invoiceInstance
    }

    @Transactional
    def update(Invoice invoiceInstance) {
        if (invoiceInstance == null) {
            notFound()
            return
        }

        if (invoiceInstance.hasErrors()) {
            respond invoiceInstance.errors, view:'edit'
            return
        }

        invoiceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Invoice.label', default: 'Invoice'), invoiceInstance.id])
                redirect invoiceInstance
            }
            '*'{ respond invoiceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Invoice invoiceInstance) {

        if (invoiceInstance == null) {
            notFound()
            return
        }

        invoiceInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Invoice.label', default: 'Invoice'), invoiceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'invoice.label', default: 'Invoice'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    protected void handleMonth(Integer max, Date startDate, Date endDate) {
        params.max = Math.min(max ?: 10, 100)
        params.sort = 'id';

        def resuts = Invoice.findAllByInvoiceDateBetween(startDate, endDate, params);
        def count = Invoice.countByInvoiceDateBetween(startDate, endDate, params);        

        respond resuts, model:[invoiceInstanceCount: count], view:'index'
    }

}

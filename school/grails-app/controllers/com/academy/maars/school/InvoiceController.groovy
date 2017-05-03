package com.academy.maars.school



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InvoiceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def assetResourceLocator;
    def pdfRenderingService;

    def renderPdf(Invoice invoiceInstance) {
        Student student = invoiceInstance.student;
        Parent parent = student.parent;
        def schedules = invoiceInstance.schedules.sort { it.id }

        response.contentType = 'application/pdf'
        response.setHeader("Content-disposition", "attachment; filename=\"whatSubject.pdf\"")

        renderPdf(
            template: '/mail/invoicePDFTemplate', 
            model: [invoice: invoiceInstance, student:student, parent:parent, 
                    schedules:schedules, rl:assetResourceLocator, docType:'PDF'], 
            filename: "invoice.pdf")
    }

    def sendEmail(Invoice invoiceInstance) {
        Student student = invoiceInstance.student;
        Parent parent = student.parent;
        def schedules = invoiceInstance.schedules.sort { it.id }

        ByteArrayOutputStream bytes = pdfRenderingService.render(
                                template: '/mail/invoicePDFTemplate', 
                                model: [invoice: invoiceInstance, student:student, parent:parent, 
                                    schedules:schedules, rl:assetResourceLocator, docType:'PDF'])

        sendMail {
            multipart true
            to parent.email
            subject "INVOICE"
            html g.render(
                template:'/mail/invoiceEmailTemplate', 
                model:[invoice:invoiceInstance, student:student, parent:parent,
                        schedules:schedules, docType:'EMAIL'])

            attachBytes "studentInvoice.pdf", "application/pdf", bytes.toByteArray()
        }
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Invoice.list(params), model:[invoiceInstanceCount: Invoice.count()]
    }

    def show(Invoice invoiceInstance) {
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
}

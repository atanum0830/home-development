package com.academy.maars.school



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SubjectController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def assetResourceLocator;
    def pdfRenderingService;

    def renderPdf(Subject subjectInstance) {
        response.contentType = 'application/pdf'
        response.setHeader("Content-disposition", "attachment; filename=\"whatSubject.pdf\"")

        renderPdf(template: '/mail/test', model: [subjects: Subject.list(), rl:assetResourceLocator], filename: "whatSubject.pdf")
    }

    def sendEmail(Subject subjectInstance) {
        ByteArrayOutputStream bytes = pdfRenderingService.render(template: '/mail/test', model: [subjects: Subject.list(), rl:assetResourceLocator])

        sendMail {
            multipart true
            to "calcchelsea@gmail.com"
            subject "INVOICE"
            html g.render(template:'/mail/invoiceTemplate', model:[schedules: Schedule.list()])
            attachBytes "invoice.pdf", "application/pdf", bytes.toByteArray()
        }
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Subject.list(params), model:[subjectInstanceCount: Subject.count()]
    }

    def show(Subject subjectInstance) {
        respond subjectInstance
    }

    def create() {
        respond new Subject(params)
    }

    @Transactional
    def save(Subject subjectInstance) {
        if (subjectInstance == null) {
            notFound()
            return
        }

        if (subjectInstance.hasErrors()) {
            respond subjectInstance.errors, view:'create'
            return
        }

        
        subjectInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'subject.label', default: 'Subject'), subjectInstance.id])
                redirect subjectInstance
            }
            '*' { respond subjectInstance, [status: CREATED] }
        }
    }

    def edit(Subject subjectInstance) {
        respond subjectInstance
    }

    @Transactional
    def update(Subject subjectInstance) {
        if (subjectInstance == null) {
            notFound()
            return
        }

        if (subjectInstance.hasErrors()) {
            respond subjectInstance.errors, view:'edit'
            return
        }

        subjectInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Subject.label', default: 'Subject'), subjectInstance.id])
                redirect subjectInstance
            }
            '*'{ respond subjectInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Subject subjectInstance) {

        if (subjectInstance == null) {
            notFound()
            return
        }

        subjectInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Subject.label', default: 'Subject'), subjectInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'subject.label', default: 'Subject'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
/*
    protected void sendEmail() {
        sendMail {
            to "atanum0830@gmail.com"
            subject "This is a test mail"
            body "Hello, This is a test mail, how are you?"
        }
    }
*/
/*
    protected void sendEmail() {
        sendMail {
            to "calcchelsea@gmail.com"
            subject "INVOICE"
            html g.render(template:'/mail/invoiceTemplate', model:[schedules: Schedule.list()])

        }

    }
*/

}

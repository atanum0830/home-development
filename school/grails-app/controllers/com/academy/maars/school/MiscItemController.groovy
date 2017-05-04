package com.academy.maars.school



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MiscItemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MiscItem.list(params), model:[miscItemInstanceCount: MiscItem.count()]
    }

    def show(MiscItem miscItemInstance) {
        respond miscItemInstance
    }

    def create() {
        respond new MiscItem(params)
    }

    @Transactional
    def save(MiscItem miscItemInstance) {
        if (miscItemInstance == null) {
            notFound()
            return
        }

        if (miscItemInstance.hasErrors()) {
            respond miscItemInstance.errors, view:'create'
            return
        }

        miscItemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'miscItem.label', default: 'MiscItem'), miscItemInstance.id])
                redirect miscItemInstance
            }
            '*' { respond miscItemInstance, [status: CREATED] }
        }
    }

    def edit(MiscItem miscItemInstance) {
        respond miscItemInstance
    }

    @Transactional
    def update(MiscItem miscItemInstance) {
        if (miscItemInstance == null) {
            notFound()
            return
        }

        if (miscItemInstance.hasErrors()) {
            respond miscItemInstance.errors, view:'edit'
            return
        }

        miscItemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MiscItem.label', default: 'MiscItem'), miscItemInstance.id])
                redirect miscItemInstance
            }
            '*'{ respond miscItemInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MiscItem miscItemInstance) {

        if (miscItemInstance == null) {
            notFound()
            return
        }

        miscItemInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MiscItem.label', default: 'MiscItem'), miscItemInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'miscItem.label', default: 'MiscItem'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

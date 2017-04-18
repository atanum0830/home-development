package com.academy.maars.school



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RateController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Rate.list(params), model:[rateInstanceCount: Rate.count()]
    }

    def show(Rate rateInstance) {
        respond rateInstance
    }

    def create() {
        respond new Rate(params)
    }

    @Transactional
    def save(Rate rateInstance) {
        if (rateInstance == null) {
            notFound()
            return
        }

        if (rateInstance.hasErrors()) {
            respond rateInstance.errors, view:'create'
            return
        }

        rateInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'rate.label', default: 'Rate'), rateInstance.id])
                redirect rateInstance
            }
            '*' { respond rateInstance, [status: CREATED] }
        }
    }

    def edit(Rate rateInstance) {
        respond rateInstance
    }

    @Transactional
    def update(Rate rateInstance) {
        if (rateInstance == null) {
            notFound()
            return
        }

        if (rateInstance.hasErrors()) {
            respond rateInstance.errors, view:'edit'
            return
        }

        rateInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Rate.label', default: 'Rate'), rateInstance.id])
                redirect rateInstance
            }
            '*'{ respond rateInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Rate rateInstance) {

        if (rateInstance == null) {
            notFound()
            return
        }

        rateInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Rate.label', default: 'Rate'), rateInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'rate.label', default: 'Rate'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

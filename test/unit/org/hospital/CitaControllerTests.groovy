package org.hospital



import org.junit.*
import grails.test.mixin.*
import javax.servlet.http.HttpServletResponse

@TestFor(CitaController)
@Mock(Cita)
class CitaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cita/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.citaInstanceList.size() == 0
        assert model.citaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.citaInstance != null
    }

    void testSave() {
        controller.save()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.save()

        assert model.citaInstance != null
        assert view == '/cita/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cita/show/1'
        assert controller.flash.message != null
        assert Cita.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cita/list'


        populateValidParams(params)
        def cita = new Cita(params)

        assert cita.save() != null

        params.id = cita.id

        def model = controller.show()

        assert model.citaInstance == cita
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cita/list'


        populateValidParams(params)
        def cita = new Cita(params)

        assert cita.save() != null

        params.id = cita.id

        def model = controller.edit()

        assert model.citaInstance == cita
    }

    void testUpdate() {

        controller.update()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cita/list'

        response.reset()


        populateValidParams(params)
        def cita = new Cita(params)

        assert cita.save() != null

        // test invalid parameters in update
        params.id = cita.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cita/edit"
        assert model.citaInstance != null

        cita.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cita/show/$cita.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cita.clearErrors()

        populateValidParams(params)
        params.id = cita.id
        params.version = -1
        controller.update()

        assert view == "/cita/edit"
        assert model.citaInstance != null
        assert model.citaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cita/list'

        response.reset()

        populateValidParams(params)
        def cita = new Cita(params)

        assert cita.save() != null
        assert Cita.count() == 1

        params.id = cita.id

        controller.delete()

        assert Cita.count() == 0
        assert Cita.get(cita.id) == null
        assert response.redirectedUrl == '/cita/list'
    }
}

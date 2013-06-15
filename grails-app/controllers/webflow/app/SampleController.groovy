package webflow.app

class SampleController {

    def index() {
        redirect(action: "test")
    }

    def testFlow = {
        page1 {
            on("next").to "page2"
            on("cancel").to "cancel"
        }

        page2 {
            on("next"){
                println "params: $params"
            }.to "page2"
            on("cancel").to "cancel"
        }
    }
}

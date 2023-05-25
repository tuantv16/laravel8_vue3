import { createApp } from 'vue'
import App from './App.vue'
//import axios from 'axios'
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'
import VueSweetalert2 from "vue-sweetalert2";
import "sweetalert2/dist/sweetalert2.min.css";
import Paginate from "vuejs-paginate-next";
import axios from 'axios'

import VueAxios from 'vue-axios'

import router from './routes'

const app = createApp(App)
app.use(router)
app.use(VueAxios, axios)
app.use(VueSweetalert2)
app.use(Paginate)
app.mount('#app')
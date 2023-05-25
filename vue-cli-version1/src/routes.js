import { createRouter, createWebHistory } from 'vue-router'

import Home from '@/components/HelloWorld.vue'
import Posts from '@/components/Posts/List.vue'
import PostAdd from '@/components/Posts/Add.vue'
import PostEdit from '@/components/Posts/Edit.vue'
import Demo from '@/components/Demo/List.vue'
import DemoSearch from '@/components/Demo/Search.vue'

const routerArrs = [
    {
        path: '/',
        component: Home
    }
    ,
    {
        path: '/posts',
        name: 'posts.list',
        component: Posts
    },
    {
        path: '/posts/add',
        
        component: PostAdd
    },
    {
        path: '/posts/edit/:id',
        name: 'posts-edit',
        component: PostEdit
    },
    {
        path: '/demo',
        name: 'demo.list',
        component: Demo
    },
    {
        path: '/demo/search',
        name: 'demo.search',
        component: DemoSearch
    },
    // {
    //     path: '/contact',
    //     component: Contact
    // },
]

const routerMain = createRouter({
    history: createWebHistory(),
    routes: routerArrs
})

export default routerMain
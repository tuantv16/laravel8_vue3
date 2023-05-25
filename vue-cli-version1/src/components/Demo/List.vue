
<template>
    <div class="hello">
        <h1>Cdemo list</h1>
        <!-- <ol>
            <li v-for="(item, index) in groceryList" :key="index"> {{ item.text }}</li>
        </ol> -->
        <TodoItem 
            :dataItem = groceryList
            @item-id="movePage" 
        />

        <input type="button" class="btn btn-primary" value="Edit" /> 
    </div>

</template>
<script>
import TodoItem from './container/TodoList.vue'
export default {
    name: 'demo_list',
    components: {
        TodoItem
    },
    data() {
        return {
            groceryList: [
                {id : 0, text : 'Trần Duy Trường', age: 24},
                {id : 1, text : 'Ngô Bá Thịnh', age: 25},
                {id : 2, text : 'Lê Ngọc Bảo', age: 26}
            ]
        }
    },
    props: {
       
    },
    methods: {
        movePage: function(valueId) {
            alert('value' + valueId)
        }
    }
}

</script>
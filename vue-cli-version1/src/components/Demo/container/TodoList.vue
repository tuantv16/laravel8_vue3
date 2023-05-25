
<template>
    <div class="hello">
        <h1>Todo list2</h1>
        
        <ol>
            <li v-for="(item, index) in dataItem" :key="index"> <a @click="hanldeEdit(item.id)">{{ item.text }} </a></li>
        </ol>
    </div>

</template>
<script>

export default {
    name: 'todo-list',
    components: {
       
    },
    data() {
        return {
            // groceryList: [
            //     {id : 0, text : 'Trần Duy Trường', age: 24},
            //     {id : 1, text : 'Ngô Bá Thịnh', age: 25},
            //     {id : 2, text : 'Lê Ngọc Bảo', age: 26}
            // ]
        }
    },
    props: {
        dataItem: {
           type: Array,
           default: () => []
       },
    },
    methods: {
        hanldeEdit: function(id) {
            //alert(id)
            this.$emit("item-id", id)
        }
    }
}

</script>
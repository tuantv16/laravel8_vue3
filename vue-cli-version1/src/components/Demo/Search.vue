
<template>
    <div class="hello">
        <h1>Search list</h1>
       
        <form id="search">
            Search <input name="query" class="form-control" v-model="searchQuery" @click="handleClick">
        </form>
        <hr/>
        <demo-gird
            :gridData="gridData"
            :columns="gridColumns"
            :filter-key="searchQuery">
        </demo-gird>
    </div>

</template>
<script>
// import TodoItem from './container/TodoList.vue'
import DemoGird from './container/DemoGird.vue'
export default {
    name: 'demo_search',
    components: {
        DemoGird
    },
    data: () => ({
        searchQuery: 'Bruce Lee',
        gridColumns: ['name', 'power'],
        gridData: [
            { name: 'Chuck Norris', power: Infinity },
            { name: 'Bruce Lee', power: 9000 },
            { name: 'Jackie Chan', power: 7000 },
            { name: 'Jet Li', power: 8000 }
        ]
    }),
    props: {
       
    },
    methods: {
        handleClick: function() {
            alert(12345);
            return this.gridData.filter((item)=>{
                console.log(item)
                return this.searchQuery.toLowerCase().split(' ').every(v => item.name.toLowerCase().includes(v))
            })
        }
        
        // movePage: function(valueId) {
        //     alert('value' + valueId)
        // }
    }
}

</script>
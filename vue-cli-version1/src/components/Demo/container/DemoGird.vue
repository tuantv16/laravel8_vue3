
<template>
    <div class="hello">
        <table>
            <tr>
                <th v-for="(title, index) in columns" :key="index">{{ title }}</th>
            </tr>
            <tr v-for="(row, index) in gridData" :key="index">
                <td>{{ row.name }}</td>
                <td>{{ row.power }}</td>
            </tr>
        </table>
    </div>

</template>
<script>

export default {
    name: 'demo-list',
    components: {
       
    },
    data: () => ( {
        
    }),
    props: {
        gridData: {
            type: Array,
            default: () => []
        },
        columns: {
            type: Array,
            default: () => []
        },
        searchQuery: {
            type: String,
            default: ''
        },

    // :data="gridData"
    //         :columns="gridColumns"
    //         :filter-key="searchQuery">
    },
    methods: {
        // hanldeEdit: function(id) {
        //     this.$emit("item-id", id)
        // }
    }
}

</script>

<style>
   table {
  border: 2px solid #42b983;
  border-radius: 3px;
  background-color: #fff;
}

th {
  background-color: #42b983;
  color: rgba(255, 255, 255, 0.66);
  cursor: pointer;
  user-select: none;
}

td {
  background-color: #f9f9f9;
}

th,
td {
  min-width: 120px;
  padding: 10px 20px;
}

th.active {
  color: #fff;
}

th.active .arrow {
  opacity: 1;
}

.arrow {
  display: inline-block;
  vertical-align: middle;
  width: 0;
  height: 0;
  margin-left: 5px;
  opacity: 0.66;
}

.arrow.asc {
  border-left: 4px solid transparent;
  border-right: 4px solid transparent;
  border-bottom: 4px solid #fff;
}

.arrow.dsc {
  border-left: 4px solid transparent;
  border-right: 4px solid transparent;
  border-top: 4px solid #fff;
}

</style>
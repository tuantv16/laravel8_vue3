<template>
    <div class="hello">
        <h1>Danh sách bài viết</h1>

        <div class="row" style="margin-bottom: 10px;">
            <div class="col-md-12">
                <h4>Tìm kiếm dữ liệu</h4>
                <form class="form-inline" v-on:submit.prevent="onSubmit">
                    <div class="form-group">
                    <label class="control-label col-sm-4" for="title">Tên bài viết:</label>
                        <div class="col-sm-4">
                            <input type="title" class="form-control" id="title" v-model="formSearch.title" placeholder="Nhập tiêu đề" name="title">
                        </div>
                    </div>

                    <div class="form-group">
                    <label class="control-label col-sm-4" for="pwd">Mô tả bài viết:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="description" v-model="formSearch.description" placeholder="Nhập mô tả" name="description">
                        </div>
                    </div>
                
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-10">
                            <button type="submit" class="btn btn-primary" @click="searchPosts(1)" >Search</button>
                        </div>
                    </div>
                </form>

            </div>

            <div class="col-md-5">
                <router-link to="/posts/add" class="btn btn-primary">Thêm</router-link>
            </div>
        </div>

        <table style="width:100%" border="1">
            <thead>
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">Tên bài viết</th>
                    <th class="text-center">Mô tả bài viết</th>
                    <th class="text-center">Sở thích</th>
                    <th class="text-center">Giới tính</th>
                    <th class="text-center">Danh mục</th>
                    <th class="text-center" style="width: 150px;">Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="item in posts" :key="item.id">
                    <td class="text-center">{{ item.id }}</td>
                    <td>{{ item.title }}</td>
                    <td>{{ item.description }}</td>
                    
                    <td>{{ item.strHobbie }}</td>
                    <td>{{ item.gender == 1 ? 'Nam' : (item.gender == 2 ? 'Nữ' : 'Khác') }}</td>
                    <td><span v-if="item.category">{{ item.category.name }}</span></td>
                    <td class="text-center"><router-link :to="{ name: 'posts-edit', params: { id: item.id } }"
                            class="btn btn-primary process">Sửa</router-link>
                        <a class="btn btn-primary process" @click="deletePosts(item.id)"> Del </a>
                    </td>
                </tr>

            </tbody>

        </table>
        <div class="row" style="margin-top: 10px; float: right;">
            <div class="col-md-12">
                <paginate :page-count="5" :page-range="3" :margin-pages="2" :click-handler="searchPosts"
                    :prev-text="'Lùi lại'" :next-text="'Tiếp theo'" :container-class="'pagination'"
                    :page-class="'page-item'">
                </paginate>
            </div>
        </div>


    </div>
</template>
  
<script>
import axios from 'axios';
import Paginate from 'vuejs-paginate-next';
export default {
    name: 'post-list',
    components: {
        paginate: Paginate,
    },
    data() {
        return {
            posts: [],
            formSearch: {
                // page: 1,
                title: '',
                description : '',
                gender: 1,
                category_id : 0
            },
            hobbie : [
                    { label: 'Bóng đá', hobbie_value: 1 },
                    { label: 'Cầu lông', hobbie_value: 2 },
                    { label: 'Chạy bộ', hobbie_value: 3 },
                ],
            
        }
    },
    props: {
        msg: String
    },
    methods: {
        searchPosts(page) {
            // console.log('phan trang');
            // console.log(page);

            //console.log();
            let params = this.formSearch;
            //console.log(params);
            this.getListData(page, params);
        },
        deletePosts($id) {
            const self = this;
            axios.delete("http://laravel8.local/api/posts/" + $id)
                .then((response) => {
                    console.log(response);
                    self.$swal.fire({
                        text: "Success, Posts has been deleted successfully !",
                        icon: "success",
                        position: "center",
                        timer: 5000,
                    });

                    self.$router.go(0) // reload pa
                })
                .catch((err) => {
                    console.log('loi roi');
                    console.log(err)
                })
        },
        getListData(page = '', params = {}) {
            let url = "http://laravel8.local/api/posts";
            let obj = {
                    page: page,
                    title: typeof(params.title) != 'undefined' ? params.title : '',
                    description: typeof(params.description) != 'undefined' ? params.description : ''
            };

            const self = this;

            axios.get(url, {
                params: obj
            }).then((response) => {
                let resData = response.data.data;
                //this.posts = response.data.data;
               
                let lookups = {}; // kết quả sẽ ra dạng {1: 'Bóng đá', 2: 'Cầu lông', 3: 'Chạy bộ'}
                for (let i = 0, len = self.hobbie.length; i < len; i++) {
                    lookups[self.hobbie[i].hobbie_value] = self.hobbie[i].label;
                }
                
                let tmpVal = [];
                resData.forEach((row, index) => {
                    tmpVal = row.hobbie.split(","); // ['2', '3'] hoặc ['2']
                   
                    let strHobbie = '';
                    for (let i = 0, len = tmpVal.length; i < len; i++) {
                        let id= parseInt(tmpVal[i]);
                        if (id) {
                            strHobbie += lookups[id]+', '; // Cầu lông,Chạy bộ,
                        }
                    }
                    strHobbie = strHobbie.slice(0, -2); // loại bỏ dấu phẩy và dấu cách cuối cùng (2 phần tử cuối cùng)
                    resData[index].strHobbie = strHobbie;
                    resData[index].category = row.category;
                });
                this.posts = resData;
                console.log(this.posts);
            })
            .catch((err) => {
                console.log('loi roi');
                console.log(err)
            })
        }

    },
    created() {

    },
    mounted() {
        this.getListData(1);
    }
}
</script>

<style lang="css">
.pagination {}

.page-item:hover {
    cursor: pointer;
}

.process {
    margin: 5px;
}
</style>
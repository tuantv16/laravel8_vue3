
<template>
    <div class="hello">
        <h1>Thêm bài viết</h1>

        <form @submit.prevent="saveForm">
            <div class="form-group">
                <label for="title">Tiêu đề</label>
                <input type="title" class="form-control" v-model="state.posts.title" id="title" placeholder="Tiêu đề">
                <span class="error" v-if="v$.posts.title.$error"> {{ v$.posts.title.$errors[0].$message }} </span>
            </div>
            <div class="form-group">
                <label for="description">Nội dung mô tả</label>
                <input type="description" class="form-control" v-model="state.posts.description" id="title" placeholder="Mô tả">
                <span class="error" v-if="v$.posts.description.$error"> {{ v$.posts.description.$errors[0].$message }} </span>
            </div>

            <div class="form-group">
                <div>Sở thích</div>
                <label v-for="(item, index) in posts.hobbie" :key="index"> {{ item.label }}
                    <input  type="checkbox" :value="item.value" v-model="item.input_checked" class="hobby_label" />
                </label>
            </div>

            <div class="form-group">
                <div>Giới tính</div>
                <input type="radio" id="nam" value="1" v-model="posts.gender" class="pad5" />
                <label for="nam" class="pad15">Nam</label>

                <input type="radio" id="nu" value="2" v-model="posts.gender" class="pad5" />
                <label for="nu" class="pad15">Nữ</label>

                <input type="radio" id="khac" value="3" v-model="posts.gender" class="pad5" />
                <label for="khac" class="pad15">Khác</label>
            </div>

            <div class="form-group">
                <div>Danh mục</div>
                <select class="form-control"  aria-label="Default select example" v-model="state.posts.category_id" style="width: 200px;">
                    <option :value="item.id" v-for="(item, index) in category" :key="index" >{{ item.name }}</option>
                </select>
                <span class="error" v-if="v$.posts.category_id.$error"> {{ v$.posts.category_id.$errors[0].$message }} </span>
            </div>

            <button type="submit" class="btn btn-primary">Thêm mới</button>
        </form>
    </div>
</template>
  
<script>
import axios from 'axios'
import { reactive, computed } from 'vue'
import useValidate from '@vuelidate/core'
import { required, minLength, helpers  } from '@vuelidate/validators'

export default {
    setup() {
        const state = reactive({
            posts:  {
                title: '',
                description : '',
                category_id : ''
            }
        })

        const rules = computed(() => {
            return {
                posts: {
                    title: { 
                        required : helpers.withMessage("Tiêu đề không được bỏ trống",required),
                        minLength: helpers.withMessage(
                        ({
                            // $pending,
                            $invalid,
                            $params,
                            $model
                        }) => `Dữ liệu đầu vào '${$model}'phải có độ dài lớn hơn  ${$params.min} ký tự.  ${$invalid ? 'invalid' : 'valid'}`,
                        minLength(6)
                        )
                    },
                    description: { 
                        required : helpers.withMessage("Mô tả bài viết không được bỏ trống", required),
                    },
                    category_id: { 
                        required : helpers.withMessage("Danh mục không được bỏ trống",required),
                    }
                    // description: { required },
                },
            }
        })

        const v$ = useValidate(rules, state)

        return { state, v$ }
    },
    data() {
        return {
            posts:  {
                title: '',
                description : '',
                hobbie : [
                    { label: 'Bóng đá', value: 1, input_checked: false },
                    { label: 'Cầu lông', value: 2, input_checked: false },
                    { label: 'Chạy bộ', value: 3, input_checked: false },
                ],
                gender: 1,
                category_id : 0
            },
            category : [],
            
        }
    },
    name: 'post-add',
    props: {
        msg: String
    },
    // async created() {
    //    let result = await axios.get('https://api.coindesk.com/v1/bpi/currentprice.json');
    //    console.log(result);
    // },

     methods: {
        saveForm: function() {
            
             let self = this;
            // var title = this.state.posts.title;
            // var description = this.state.posts.description;
            let hobbie = this.posts.hobbie;
            hobbie = hobbie.filter(item => item.input_checked).map(item =>item.value) // Tìm những item input_checked checked = true => lấy value tương ứng
           
            var posts = {
                title : this.state.posts.title,
                description : this.state.posts.description,
                hobbie : hobbie,
                gender: this.posts.gender,
                category_id : this.state.posts.category_id
            };
            console.log(posts);
            self.$swal.fire({
                title: 'Do you want to save posts?',
                // showDenyButton: true,
                showCancelButton: true,
                confirmButtonText: 'Save',
                denyButtonText: `Don't save`,
                
            }).then((result) => {
                if (result.isConfirmed) {

                    //validate
                   
                    this.v$.$validate() // checks all inputs
                    if (this.v$.$error) {
                        return false;
                    }
                    
                    axios.post("http://laravel8.local/api/posts", posts )
                        .then(function (res) {
                            console.log(res)
                            //router.push({ path: '/posts' })
                            self.$swal.fire({
                                text: "Success, Posts has been created successfully !",
                                icon: "success",
                                position: "center",
                                timer: 5000,
                            });
                             self.$router.push({name: 'posts.list'})
                        })
                        .catch(function (err) {
                            console.log('loi roi');
                            console.log(err)
                        })
                } else if (result.isDenied) {
                    self.$swal.fire('Changes are not saved', '', 'info')
                }
            })
            
        }
    },
    created() {
        const self = this;
        axios.get("http://laravel8.local/api/category" )
            .then(function (res) {
                 self.category = res.data
            })
            .catch(function (err) {
                console.log('loi roi');
                console.log(err)
            })

    }
}
</script>

<style>
    .error {
        color: red
    }

    .hobby {
        margin-right: 5px;
    }

    .hobby_label {
        margin-right: 15px;
    }

    .pad5 {
        margin-right: 5px;
    }

    .pad15 {
        margin-right: 15px;
    }
</style>
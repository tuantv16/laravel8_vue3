
<template>
    <div class="hello">
        <h1>Cập nhật bài viết</h1>
        <form @submit.prevent="updateForm">
                <div class="form-group">
                    <label for="exampleInputEmail1">Tiêu đề</label>
                    <input type="title" class="form-control" v-model="posts.title" id="title" placeholder="Tiêu đề">
                    <span class="error" v-if="v$.posts.title.$error"> {{ v$.posts.title.$errors[0].$message }} </span>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Nội dung mô tả</label>
                    <input type="description" class="form-control" v-model="posts.description" id="title" placeholder="Mô tả">
                    <span class="error" v-if="v$.posts.description.$error"> {{ v$.posts.description.$errors[0].$message }} </span>
                </div>
                <div class="form-group">
                    <div>Sở thích</div>
                    <label 
                            v-for="(item, index) in posts.hobbie"
                            :key="index"
                        > {{ item.label }}
                            <input 
                                type="checkbox"
                                :value="item.value"
                                v-model="item.input_checked"
                                class="hobby_label"
                                />

                    </label>
                </div>

                <div class="form-group">
                    <div>Giới tính</div>
                    <div class="form-group">
                        <input type="radio" id="nam" value="1" v-model="posts.gender" class="pad5" />
                        <label for="nam" class="pad15">Nam</label>

                        <input type="radio" id="nu" value="2" v-model="posts.gender" class="pad5" />
                        <label for="nu" class="pad15">Nữ</label>

                        <input type="radio" id="khac" value="3" v-model="posts.gender" class="pad5" />
                        <label for="khac" class="pad15">Khác</label>
                    </div>
                </div>

                <div class="form-group">
                <div>Danh mục</div>
                <select class="form-control"  aria-label="Default select example" v-model="posts.category_id" style="width: 200px;">
                    <option :value="item.id" v-for="(item, index) in category" :key="index" >{{ item.name }}</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Cập nhật</button>
        </form>
    </div>
</template>
  
<script>
 import axios from 'axios';
 import { reactive, computed, isProxy, toRaw } from 'vue'
import useValidate from '@vuelidate/core'
import { required, minLength, helpers  } from '@vuelidate/validators'

export default {
    setup() {
        const state = reactive({
            posts:  {
                title: '',
                description : ''
            }
        })

        const rules = computed(() => {
            return {
                posts: {
                    title: { 
                        required : helpers.withMessage("Tiêu đề không được bỏ trống", required),
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
                gender : 0,
                category_id : 0
            },
            category : []
        }
    },
    name: 'post-edit',
    props: {
        msg: String
    },
     methods: {
        updateForm: function() {
            let id = this.$route.params.id;
            let self = this;
            // let title = this.posts.title;
            // let description = this.posts.description;
          
            let hobbie = this.posts.hobbie;
            hobbie = hobbie.filter(item => item.input_checked).map(item =>item.value) // Tìm những item input_checked checked = true => lấy value tương ứng
           
            var posts = {
                title : this.posts.title,
                description : this.posts.description,
                hobbie : hobbie,
                gender : this.posts.gender,
                category_id : this.posts.category_id
            };

            self.$swal.fire({
                title: 'Do you want to save posts?',
                // showDenyButton: true,
                showCancelButton: true,
                confirmButtonText: 'Save',
                denyButtonText: `Don't save`,
            }).then((result) => {

                /* Read more about isConfirmed, isDenied below */

                if (result.isConfirmed) {
                    // this.v$.$validate() // comment tạm thời bỏ check validate
                    // if (this.v$.$error) {
                    //     return false;
                    // }

                    axios.put("http://laravel8.local/api/posts/"+id, posts)
                        .then(function () {
                           
                            //router.push({ path: '/posts' })
                            self.$swal.fire({
                                text: "Success, Post has been updated successfully !",
                                icon: "success",
                                position: "center",
                                timer: 5000
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
        let id = this.$route.params.id;
        const self = this;

        // Hiển thị thông tin bài viết
        axios.get("http://laravel8.local/api/posts/"+id)
              .then((response) => {
                  let resPosts = response.data.data;
                
                     self.posts.title = resPosts.title;
                     self.posts.description = resPosts.description;
                     // checked dữ liệu ban đầu
                    
                    let hobbieCustom = {};
                    if (isProxy(this.posts.hobbie)) {
                        hobbieCustom = toRaw(this.posts.hobbie);
                    }
                    // hoặc có thể dùng như này:
                    // let hobbieCustom = JSON.parse(JSON.stringify(this.posts.hobbie)); // mảng khời tạo ban đầu ở khu vực data

                    hobbieCustom.forEach((element, index )=> { // duyệt từng phần từ ở mảng ban đầu (hobbieCustom) so sánh với dữ liệu trong DB (resPosts). Néu giống nhau thì set lại giá trị cho mảng ban đầu checked là true
                        if (resPosts.hobbie.includes(element.value) == true) {
                            self.posts.hobbie[index].input_checked = true;
                        }
                    });

                    self.posts.gender = resPosts.gender;
                    self.posts.category_id = resPosts.category.id;
              })
              .catch((err) => {
                  console.log('ERROR when process ajax');
                  console.log(err)
              })

        // Hiển thị thông tin danh mục
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
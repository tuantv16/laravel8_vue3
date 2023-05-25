<template>
    <div id="app">
      <nav class="navbar navbar-expand navbar-dark bg-dark">
        <router-link to="/" class="navbar-brand">bezKoder</router-link>
        <div class="navbar-nav mr-auto">
          <li class="nav-item">
            <router-link to="/demo" class="nav-link">Demo (Prop Emit)</router-link>
          </li>
          <li class="nav-item">
            <router-link to="/demo/search" class="nav-link">Demo (Search)</router-link>
          </li>
          <li class="nav-item">
            <router-link to="/posts" class="nav-link">Bài viết</router-link>
          </li>
          <li class="nav-item">
            <router-link to="/news" class="nav-link">Tin tức</router-link>
          </li>
          <li class="nav-item">
            <router-link to="/contact" class="nav-link">Liên hệ</router-link>
          </li>
        </div>
      </nav>
  
      <div class="container mt-3">
        <router-view />
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: "app"
  };
  </script>
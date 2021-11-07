# frozen_string_literal: true

module Spina
  module Admin
    module Conferences::Blog
      # Spina::Admin::Conferences::Blog::PostsController
      class PostsController < AdminController
        before_action :post, except: %i[index live draft future new create]
        before_action :set_breadcrumb
        before_action :set_tabs, only: %i[new create edit update]
        before_action :set_locale

        decorates_assigned :post

        layout 'spina/admin/conferences/blog/blog'

        def index
          @posts = Spina::Admin::Conferences::Blog::Post.order(created_at: :desc)
        end

        def live
          @posts = Spina::Admin::Conferences::Blog::Post.live.order(created_at: :desc)
          render :index
        end

        def draft
          @posts = Spina::Admin::Conferences::Blog::Post.draft.order(created_at: :desc)
          render :index
        end

        def future
          @posts = Spina::Admin::Conferences::Blog::Post.future.order(created_at: :desc)
          render :index
        end

        def new
          @post = Spina::Admin::Conferences::Blog::Post.new
          add_breadcrumb I18n.t('spina.blog.posts.new')
          render layout: 'spina/admin/admin'
        end

        def create
          @post = Spina::Admin::Conferences::Blog::Post.new post_params
          if @post.save
            redirect_to spina.edit_admin_conferences_blog_post_url(@post.id),
                        notice: t('spina.blog.posts.saved')
          else
            add_breadcrumb I18n.t('spina.blog.posts.new')
            render :new, layout: 'spina/admin/admin'
          end
        end

        def edit
          add_breadcrumb @post.title
          render layout: 'spina/admin/admin'
        end

        def update
          if @post.update(post_params)
            add_breadcrumb @post.title
            redirect_to spina.edit_admin_conferences_blog_post_url(
              @post.id, params: { locale: @locale }
            ), notice: t('spina.blog.posts.saved')
          else
            render :edit, layout: 'spina/admin/admin'
          end
        end

        def destroy
          @post.destroy
          redirect_to spina.admin_conferences_blog_posts_path
        end

        private

        def post
          @post = Spina::Admin::Conferences::Blog::Post.find(params[:id])
        end

        def set_breadcrumb
          add_breadcrumb I18n.t('spina.blog.posts.title'),
                         spina.admin_conferences_blog_posts_path
        end

        def set_tabs
          @tabs = %w[post_content post_configuration post_seo]
        end

        def set_locale
          @locale = params[:locale] || I18n.default_locale
          I18n.locale = @locale
        end

        def post_params
          params.require(:post).permit(
            :title, :slug, :excerpt, :content, :image_id, :draft, :published_at,
            :user_id, :category_id, :featured, :seo_title, :description
          )
        end
      end
    end
  end
end

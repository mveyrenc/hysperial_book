# frozen_string_literal: true

# == Route Map
#
# Routes for application:
#                                   Prefix Verb   URI Pattern                                                                                       Controller#Action
#                         new_user_session GET    /auth/login(.:format)                                                                             devise/sessions#new
#                             user_session POST   /auth/login(.:format)                                                                             devise/sessions#create
#                     destroy_user_session DELETE /auth/logout(.:format)                                                                            devise/sessions#destroy
#                        new_user_password GET    /auth/forgotten-password/new(.:format)                                                            devise/passwords#new
#                       edit_user_password GET    /auth/forgotten-password/edit(.:format)                                                           devise/passwords#edit
#                            user_password PATCH  /auth/forgotten-password(.:format)                                                                devise/passwords#update
#                                          PUT    /auth/forgotten-password(.:format)                                                                devise/passwords#update
#                                          POST   /auth/forgotten-password(.:format)                                                                devise/passwords#create
#                 cancel_user_registration GET    /auth/register/cancel(.:format)                                                                   registrations#cancel
#                    new_user_registration GET    /auth/register/sign-up(.:format)                                                                  registrations#new
#                   edit_user_registration GET    /auth/register/edit(.:format)                                                                     registrations#edit
#                        user_registration PATCH  /auth/register(.:format)                                                                          registrations#update
#                                          PUT    /auth/register(.:format)                                                                          registrations#update
#                                          DELETE /auth/register(.:format)                                                                          registrations#destroy
#                                          POST   /auth/register(.:format)                                                                          registrations#create
#                          search_contents GET    /contents/search(.:format)                                                                        contents/contents#search
#                                 contents GET    /contents(.:format)                                                                               contents/contents#index
#                                          POST   /contents(.:format)                                                                               contents/contents#create
#                              new_content GET    /contents/new(.:format)                                                                           contents/contents#new
#                             edit_content GET    /contents/:id/edit(.:format)                                                                      contents/contents#edit
#                                  content GET    /contents/:id(.:format)                                                                           contents/contents#show
#                                          PATCH  /contents/:id(.:format)                                                                           contents/contents#update
#                                          PUT    /contents/:id(.:format)                                                                           contents/contents#update
#                                          DELETE /contents/:id(.:format)                                                                           contents/contents#destroy
#                                    users GET    /users(.:format)                                                                                  users/users#index
#                                edit_user GET    /users/:id/edit(.:format)                                                                         users/users#edit
#                                     user PATCH  /users/:id(.:format)                                                                              users/users#update
#                                          PUT    /users/:id(.:format)                                                                              users/users#update
#                                          DELETE /users/:id(.:format)                                                                              users/users#destroy
#                             search_books GET    /books/search(.:format)                                                                           books/books#search
#                     search_book_contents GET    /books/:book_id/contents/search(.:format)                                                         contents/books#search
#                            book_contents GET    /books/:book_id/contents(.:format)                                                                contents/books#index
#                                    books GET    /books(.:format)                                                                                  books/books#index
#                                          POST   /books(.:format)                                                                                  books/books#create
#                                 new_book GET    /books/new(.:format)                                                                              books/books#new
#                                edit_book GET    /books/:id/edit(.:format)                                                                         books/books#edit
#                                     book PATCH  /books/:id(.:format)                                                                              books/books#update
#                                          PUT    /books/:id(.:format)                                                                              books/books#update
#                                          DELETE /books/:id(.:format)                                                                              books/books#destroy
#              search_content_tag_families GET    /content_tag_families/search(.:format)                                                            content_tag_families/content_tag_families#search
#                     content_tag_families GET    /content_tag_families(.:format)                                                                   content_tag_families/content_tag_families#index
#                                          POST   /content_tag_families(.:format)                                                                   content_tag_families/content_tag_families#create
#                   new_content_tag_family GET    /content_tag_families/new(.:format)                                                               content_tag_families/content_tag_families#new
#                  edit_content_tag_family GET    /content_tag_families/:id/edit(.:format)                                                          content_tag_families/content_tag_families#edit
#                       content_tag_family PATCH  /content_tag_families/:id(.:format)                                                               content_tag_families/content_tag_families#update
#                                          PUT    /content_tag_families/:id(.:format)                                                               content_tag_families/content_tag_families#update
#                                          DELETE /content_tag_families/:id(.:format)                                                               content_tag_families/content_tag_families#destroy
#                      search_content_tags GET    /content_tags/search(.:format)                                                                    content_tags/content_tags#search
#                             content_tags GET    /content_tags(.:format)                                                                           content_tags/content_tags#index
#                                          POST   /content_tags(.:format)                                                                           content_tags/content_tags#create
#                          new_content_tag GET    /content_tags/new(.:format)                                                                       content_tags/content_tags#new
#                         edit_content_tag GET    /content_tags/:id/edit(.:format)                                                                  content_tags/content_tags#edit
#                              content_tag PATCH  /content_tags/:id(.:format)                                                                       content_tags/content_tags#update
#                                          PUT    /content_tags/:id(.:format)                                                                       content_tags/content_tags#update
#                                          DELETE /content_tags/:id(.:format)                                                                       content_tags/content_tags#destroy
#                           media_pictures GET    /media/pictures(.:format)                                                                         media/pictures#index
#                       edit_media_picture GET    /media/pictures/:id/edit(.:format)                                                                media/pictures#edit
#                            media_picture PATCH  /media/pictures/:id(.:format)                                                                     media/pictures#update
#                                          PUT    /media/pictures/:id(.:format)                                                                     media/pictures#update
#                                          DELETE /media/pictures/:id(.:format)                                                                     media/pictures#destroy
#                              media_scans GET    /media/scans(.:format)                                                                            media/scans#index
#                          edit_media_scan GET    /media/scans/:id/edit(.:format)                                                                   media/scans#edit
#                               media_scan PATCH  /media/scans/:id(.:format)                                                                        media/scans#update
#                                          PUT    /media/scans/:id(.:format)                                                                        media/scans#update
#                                          DELETE /media/scans/:id(.:format)                                                                        media/scans#destroy
#                          media_documents GET    /media/documents(.:format)                                                                        media/documents#index
#                      edit_media_document GET    /media/documents/:id/edit(.:format)                                                               media/documents#edit
#                           media_document PATCH  /media/documents/:id(.:format)                                                                    media/documents#update
#                                          PUT    /media/documents/:id(.:format)                                                                    media/documents#update
#                                          DELETE /media/documents/:id(.:format)                                                                    media/documents#destroy
#                                  pg_hero        /admins/postgres                                                                                  PgHero::Engine
#                                                 /cable                                                                                            #<ActionCable::Server::Base:0x00007fc161a04108 @config=#<ActionCable::Server::Configuration:0x00007fc161a046a8 @log_tags=[], @connection_class=#<Proc:0x00007fc161ae2a70 /usr/local/bundle/gems/actioncable-8.1.2/lib/action_cable/engine.rb:55 (lambda)>, @worker_pool_size=4, @disable_request_forgery_protection=false, @allow_same_origin_as_host=true, @filter_parameters=[:passw, :email, :secret, :token, :_key, :crypt, :salt, :certificate, :otp, :ssn, :cvv, :cvc], @health_check_application=#<Proc:0x00007fc161ae4cd0 /usr/local/bundle/gems/actioncable-8.1.2/lib/action_cable/engine.rb:31 (lambda)>, @logger=#<Logger:0x00007fc161a040b8 @level=0, @progname=nil, @default_formatter=#<Logger::Formatter:0x00007fc161c29668 @datetime_format=nil>, @formatter=nil, @logdev=nil, @level_override={}>, @cable={"adapter" => "redis", "url" => "redis://redis:6379"}, @mount_path="/cable", @precompile_assets=true, @allowed_request_origins=/https?:\/\/localhost:\d+/>, @mutex=#<Monitor:0x00007fc161c297a8>, @pubsub=nil, @worker_pool=nil, @event_loop=nil, @remote_connections=nil>
#                                     root GET    /                                                                                                 home#index
#         turbo_recede_historical_location GET    /recede_historical_location(.:format)                                                             turbo/native/navigation#recede
#         turbo_resume_historical_location GET    /resume_historical_location(.:format)                                                             turbo/native/navigation#resume
#        turbo_refresh_historical_location GET    /refresh_historical_location(.:format)                                                            turbo/native/navigation#refresh
#            rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                           action_mailbox/ingresses/postmark/inbound_emails#create
#               rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                              action_mailbox/ingresses/relay/inbound_emails#create
#            rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                           action_mailbox/ingresses/sendgrid/inbound_emails#create
#      rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#health_check
#            rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#create
#             rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                                       action_mailbox/ingresses/mailgun/inbound_emails#create
#           rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#index
#                                          POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#create
#        new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                                      rails/conductor/action_mailbox/inbound_emails#new
#            rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#show
# new_rails_conductor_inbound_email_source GET    /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)                              rails/conductor/action_mailbox/inbound_emails/sources#new
#    rails_conductor_inbound_email_sources POST   /rails/conductor/action_mailbox/inbound_emails/sources(.:format)                                  rails/conductor/action_mailbox/inbound_emails/sources#create
#    rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                               rails/conductor/action_mailbox/reroutes#create
# rails_conductor_inbound_email_incinerate POST   /rails/conductor/action_mailbox/:inbound_email_id/incinerate(.:format)                            rails/conductor/action_mailbox/incinerates#create
#                       rails_service_blob GET    /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)                               active_storage/blobs/redirect#show
#                 rails_service_blob_proxy GET    /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)                                  active_storage/blobs/proxy#show
#                                          GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                        active_storage/blobs/redirect#show
#                rails_blob_representation GET    /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations/redirect#show
#          rails_blob_representation_proxy GET    /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)    active_storage/representations/proxy#show
#                                          GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)          active_storage/representations/redirect#show
#                       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                       active_storage/disk#show
#                update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                               active_storage/disk#update
#                     rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                    active_storage/direct_uploads#create
#
# Routes for PgHero::Engine:
#                    Prefix Verb URI Pattern                                      Controller#Action
#                     space GET  (/:database)/space(.:format)                     pg_hero/home#space
#            relation_space GET  (/:database)/space/:relation(.:format)           pg_hero/home#relation_space
#               index_bloat GET  (/:database)/index_bloat(.:format)               pg_hero/home#index_bloat
#              live_queries GET  (/:database)/live_queries(.:format)              pg_hero/home#live_queries
#                   queries GET  (/:database)/queries(.:format)                   pg_hero/home#queries
#                show_query GET  (/:database)/queries/:query_hash(.:format)       pg_hero/home#show_query
#                    system GET  (/:database)/system(.:format)                    pg_hero/home#system
#                 cpu_usage GET  (/:database)/cpu_usage(.:format)                 pg_hero/home#cpu_usage
#          connection_stats GET  (/:database)/connection_stats(.:format)          pg_hero/home#connection_stats
#     replication_lag_stats GET  (/:database)/replication_lag_stats(.:format)     pg_hero/home#replication_lag_stats
#                load_stats GET  (/:database)/load_stats(.:format)                pg_hero/home#load_stats
#          free_space_stats GET  (/:database)/free_space_stats(.:format)          pg_hero/home#free_space_stats
#                   explain GET  (/:database)/explain(.:format)                   pg_hero/home#explain
#                      tune GET  (/:database)/tune(.:format)                      pg_hero/home#tune
#               connections GET  (/:database)/connections(.:format)               pg_hero/home#connections
#               maintenance GET  (/:database)/maintenance(.:format)               pg_hero/home#maintenance
#                      kill POST (/:database)/kill(.:format)                      pg_hero/home#kill
# kill_long_running_queries POST (/:database)/kill_long_running_queries(.:format) pg_hero/home#kill_long_running_queries
#                  kill_all POST (/:database)/kill_all(.:format)                  pg_hero/home#kill_all
#        enable_query_stats POST (/:database)/enable_query_stats(.:format)        pg_hero/home#enable_query_stats
#                           POST (/:database)/explain(.:format)                   pg_hero/home#explain
#         reset_query_stats POST (/:database)/reset_query_stats(.:format)         pg_hero/home#reset_query_stats
#              system_stats GET  (/:database)/system_stats(.:format)              redirect(301, system)
#               query_stats GET  (/:database)/query_stats(.:format)               redirect(301, queries)
#                      root GET  /(:database)(.:format)                           pg_hero/home#index

# rubocop:disable Metrics/BlockLength
Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users,
             controllers: {
               registrations: 'registrations'
             },
             path: 'auth',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               password: 'forgotten-password',
               confirmation: 'verification',
               unlock: 'unblock',
               registration: 'register',
               sign_up: 'sign-up'
             }

  resources :contents, controller: 'contents/contents' do
    collection { get :search }
  end

  resources :users, except: %i[show new create], controller: 'users/users' do
    collection { get :search }
  end

  resources :books, except: %i[show], controller: 'books/books' do
    collection { get :search }
    resources :contents, controller: 'contents/books', only: :index do
      collection { get :search }
    end
  end

  resources :content_tag_families, except: %i[show], controller: 'content_tag_families/content_tag_families' do
    collection { get :search }
  end
  resources :content_tags, except: %i[show], controller: 'content_tags/content_tags' do
    collection { get :search }
  end

  namespace :media do
    resources :pictures, except: %i[show new create], controller: 'pictures'
    resources :scans, except: %i[show new create], controller: 'scans'
    resources :documents, except: %i[show new create], controller: 'documents'
  end

  authenticate :admin do
    mount PgHero::Engine, at: '/admins/postgres'
  end

  mount ActionCable.server => '/cable'

  # Defines the root path route ("/")
  root to: 'home#index'
end
# rubocop:enable Metrics/BlockLength

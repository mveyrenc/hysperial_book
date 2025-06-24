# frozen_string_literal: true

# == Route Map
#
#                                   Prefix Verb   URI Pattern                                                                                       Controller#Action
#                              new_example GET    /example/new(.:format)                                                                            examples#new
#                             edit_example GET    /example/edit(.:format)                                                                           examples#edit
#                                  example GET    /example(.:format)                                                                                examples#show
#                                          PATCH  /example(.:format)                                                                                examples#update
#                                          PUT    /example(.:format)                                                                                examples#update
#                                          DELETE /example(.:format)                                                                                examples#destroy
#                                          POST   /example(.:format)                                                                                examples#create
#                                   test2s GET    /test2s(.:format)                                                                                 test2s#index
#                                          POST   /test2s(.:format)                                                                                 test2s#create
#                                new_test2 GET    /test2s/new(.:format)                                                                             test2s#new
#                               edit_test2 GET    /test2s/:id/edit(.:format)                                                                        test2s#edit
#                                    test2 GET    /test2s/:id(.:format)                                                                             test2s#show
#                                          PATCH  /test2s/:id(.:format)                                                                             test2s#update
#                                          PUT    /test2s/:id(.:format)                                                                             test2s#update
#                                          DELETE /test2s/:id(.:format)                                                                             test2s#destroy
#                                    tests GET    /tests(.:format)                                                                                  tests#index
#                                          POST   /tests(.:format)                                                                                  tests#create
#                                 new_test GET    /tests/new(.:format)                                                                              tests#new
#                                edit_test GET    /tests/:id/edit(.:format)                                                                         tests#edit
#                                     test GET    /tests/:id(.:format)                                                                              tests#show
#                                          PATCH  /tests/:id(.:format)                                                                              tests#update
#                                          PUT    /tests/:id(.:format)                                                                              tests#update
#                                          DELETE /tests/:id(.:format)                                                                              tests#destroy
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
#                                    books GET    /books(.:format)                                                                                  books/books#index
#                                          POST   /books(.:format)                                                                                  books/books#create
#                                 new_book GET    /books/new(.:format)                                                                              books/books#new
#                                edit_book GET    /books/:id/edit(.:format)                                                                         books/books#edit
#                                     book PATCH  /books/:id(.:format)                                                                              books/books#update
#                                          PUT    /books/:id(.:format)                                                                              books/books#update
#                                          DELETE /books/:id(.:format)                                                                              books/books#destroy
#                        content_tag_families GET    /content_tag_families(.:format)                                                                      content_tag_families/content_tag_families#index
#                                          POST   /content_tag_families(.:format)                                                                      content_tag_families/content_tag_families#create
#                     new_content_tag_family GET    /content_tag_families/new(.:format)                                                                  content_tag_families/content_tag_families#new
#                    edit_content_tag_family GET    /content_tag_families/:id/edit(.:format)                                                             content_tag_families/content_tag_families#edit
#                         content_tag_family PATCH  /content_tag_families/:id(.:format)                                                                  content_tag_families/content_tag_families#update
#                                          PUT    /content_tag_families/:id(.:format)                                                                  content_tag_families/content_tag_families#update
#                                          DELETE /content_tag_families/:id(.:format)                                                                  content_tag_families/content_tag_families#destroy
#                             content_tags GET    /content_tags(.:format)                                                                           content_tags/content_tags#index
#                                          POST   /content_tags(.:format)                                                                           content_tags/content_tags#create
#                          new_content_tag GET    /content_tags/new(.:format)                                                                       content_tags/content_tags#new
#                         edit_content_tag GET    /content_tags/:id/edit(.:format)                                                                  content_tags/content_tags#edit
#                              content_tag PATCH  /content_tags/:id(.:format)                                                                       content_tags/content_tags#update
#                                          PUT    /content_tags/:id(.:format)                                                                       content_tags/content_tags#update
#                                          DELETE /content_tags/:id(.:format)                                                                       content_tags/content_tags#destroy
#                           media_pictures GET    /media/pictures(.:format)                                                                         media/pictures#index
#                                          POST   /media/pictures(.:format)                                                                         media/pictures#create
#                        new_media_picture GET    /media/pictures/new(.:format)                                                                     media/pictures#new
#                       edit_media_picture GET    /media/pictures/:id/edit(.:format)                                                                media/pictures#edit
#                            media_picture PATCH  /media/pictures/:id(.:format)                                                                     media/pictures#update
#                                          PUT    /media/pictures/:id(.:format)                                                                     media/pictures#update
#                                          DELETE /media/pictures/:id(.:format)                                                                     media/pictures#destroy
#                              media_scans GET    /media/scans(.:format)                                                                            media/scans#index
#                                          POST   /media/scans(.:format)                                                                            media/scans#create
#                           new_media_scan GET    /media/scans/new(.:format)                                                                        media/scans#new
#                          edit_media_scan GET    /media/scans/:id/edit(.:format)                                                                   media/scans#edit
#                               media_scan PATCH  /media/scans/:id(.:format)                                                                        media/scans#update
#                                          PUT    /media/scans/:id(.:format)                                                                        media/scans#update
#                                          DELETE /media/scans/:id(.:format)                                                                        media/scans#destroy
#                          media_documents GET    /media/documents(.:format)                                                                        media/documents#index
#                                          POST   /media/documents(.:format)                                                                        media/documents#create
#                       new_media_document GET    /media/documents/new(.:format)                                                                    media/documents#new
#                      edit_media_document GET    /media/documents/:id/edit(.:format)                                                               media/documents#edit
#                           media_document PATCH  /media/documents/:id(.:format)                                                                    media/documents#update
#                                          PUT    /media/documents/:id(.:format)                                                                    media/documents#update
#                                          DELETE /media/documents/:id(.:format)                                                                    media/documents#destroy
#                                                 /cable                                                                                            #<ActionCable::Server::Base:0x00007fecf12b5828 @config=#<ActionCable::Server::Configuration:0x00007fecf12b6228 @log_tags=[], @connection_class=#<Proc:0x00007fecf33121e8 /usr/local/bundle/gems/actioncable-8.0.2/lib/action_cable/engine.rb:55 (lambda)>, @worker_pool_size=4, @disable_request_forgery_protection=false, @allow_same_origin_as_host=true, @filter_parameters=[:passw, :email, :secret, :token, :_key, :crypt, :salt, :certificate, :otp, :ssn, :cvv, :cvc], @health_check_application=#<Proc:0x00007fecf32f21e0 /usr/local/bundle/gems/actioncable-8.0.2/lib/action_cable/engine.rb:31 (lambda)>, @logger=#<Logger:0x00007fecf12b57d8 @level=0, @progname=nil, @default_formatter=#<Logger::Formatter:0x00007fecf11bbff8 @datetime_format=nil>, @formatter=nil, @logdev=nil, @level_override={}>, @cable={"adapter" => "redis", "url" => "redis://redis:6379/1"}, @mount_path="/cable", @precompile_assets=true, @allowed_request_origins=/https?:\/\/localhost:\d+/>, @mutex=#<Monitor:0x00007fecf11bc160>, @pubsub=nil, @worker_pool=nil, @event_loop=nil, @remote_connections=nil>
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

# rubocop:disable Metrics/BlockLength
Rails.application.routes.draw do
  resource :example, constraints: -> { Rails.env.development? }
  resources :test2s
  resources :tests
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

  resources :contents, controller: 'contents/contents'

  resources :users, except: %i[show new create], controller: 'users/users'

  resources :books, except: %i[show], controller: 'books/books'

  resources :content_tag_families, except: %i[show], controller: 'content_tag_families/content_tag_families'
  resources :content_tags, except: %i[show], controller: 'content_tags/content_tags'

  namespace :media do
    resources :pictures, except: %i[show], controller: 'pictures'
    resources :scans, except: %i[show], controller: 'scans'
    resources :documents, except: %i[show], controller: 'documents'
  end

  mount ActionCable.server => '/cable'

  # Defines the root path route ("/")
  root to: 'home#index'
end
# rubocop:enable Metrics/BlockLength

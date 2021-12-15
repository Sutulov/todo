# frozen_string_literal: true

Rails.application.routes.draw do
  get 'help', to: 'help#index', as: 'help_index'
  get 'about', to: 'about#index', as: 'about_index'

  get 'about/other', to: 'about#index'
  get 'about/:hello', to: 'about#index'

  get 'events/index', to: redirect(status: 302, path: '/')
  root 'events#index'
end

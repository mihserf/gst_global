class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :ident_name
      t.string  :name
      t.string  :lang
      t.text  :content

      t.timestamps
    end
    Page.create!(:lang  =>  "en", :ident_name  => "home", :name =>"Home")
    Page.create!(:lang  =>  "ru", :ident_name  => "home", :name =>"Первая страница")
    Page.create!(:lang  =>  "ua", :ident_name  => "home", :name =>"Перша сторинка")
    Page.create!(:lang  =>  "gr", :ident_name  => "home", :name =>"Home")

    Page.create!(:lang  =>  "en", :ident_name  => "contacts", :name =>"Contacts")
    Page.create!(:lang  =>  "ru", :ident_name  => "contacts", :name =>"Контакты")
    Page.create!(:lang  =>  "ua", :ident_name  => "contacts", :name =>"Контакти")
    Page.create!(:lang  =>  "gr", :ident_name  => "contacts", :name =>"Contacts")

    Page.create!(:lang  =>  "en", :ident_name  => "about_us", :name =>"About us")
    Page.create!(:lang  =>  "ru", :ident_name  => "about_us", :name =>"О компании")
    Page.create!(:lang  =>  "ua", :ident_name  => "about_us", :name =>"Про компанiю")
    Page.create!(:lang  =>  "gr", :ident_name  => "about_us", :name =>"About us")

    Page.create!(:lang  =>  "en", :ident_name  => "faq", :name =>"FAQ")
    Page.create!(:lang  =>  "ru", :ident_name  => "faq", :name =>"FAQ")
    Page.create!(:lang  =>  "ua", :ident_name  => "faq", :name =>"FAQ")
    Page.create!(:lang  =>  "gr", :ident_name  => "faq", :name =>"FAQ")


    Page.create!(:lang  =>  "en", :ident_name  => "charity", :name =>"Charity")
    Page.create!(:lang  =>  "ru", :ident_name  => "charity", :name =>"Благотворительность")
    Page.create!(:lang  =>  "ua", :ident_name  => "charity", :name =>"Благотворительность")
    Page.create!(:lang  =>  "gr", :ident_name  => "charity", :name =>"Charity")

    Page.create!(:lang  =>  "en", :ident_name  => "founder", :name =>"Founder")
    Page.create!(:lang  =>  "ru", :ident_name  => "founder", :name =>"Основатель")
    Page.create!(:lang  =>  "ua", :ident_name  => "founder", :name =>"Основатель")
    Page.create!(:lang  =>  "gr", :ident_name  => "founder", :name =>"Founder")


    Page.create!(:lang  =>  "en", :ident_name  => "team", :name =>"Executive team")
    Page.create!(:lang  =>  "ru", :ident_name  => "team", :name =>"Команда")
    Page.create!(:lang  =>  "ua", :ident_name  => "team", :name =>"Команда")
    Page.create!(:lang  =>  "gr", :ident_name  => "team", :name =>"Executive team")

    Page.create!(:lang  =>  "en", :ident_name  => "mission", :name =>"Mission statement")
    Page.create!(:lang  =>  "ru", :ident_name  => "mission", :name =>"Задачи")
    Page.create!(:lang  =>  "ua", :ident_name  => "mission", :name =>"Задачи")
    Page.create!(:lang  =>  "gr", :ident_name  => "mission", :name =>"Mission statement")

    Page.create!(:lang  =>  "en", :ident_name  => "principles", :name =>"Principles of work")
    Page.create!(:lang  =>  "ru", :ident_name  => "principles", :name =>"Принципы работы")
    Page.create!(:lang  =>  "ua", :ident_name  => "principles", :name =>"Принципы работы")
    Page.create!(:lang  =>  "gr", :ident_name  => "principles", :name =>"Principles of work")
    
  end

  def self.down
    drop_table :pages
  end
end

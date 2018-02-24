require 'rails_helper'

RSpec.describe TodosController, type: :controller do

before(:all){Todo.destroy_all}

let!(:todo) { FactoryGirl.create(:todo) }

 describe "GET index" do

    before { get :index }
    it "assigns @todos" do
      expect(assigns(:todos)).to eq([todo])
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET new" do
    before { get :new }

    it "initializes @todo" do
      expect(assigns(:todo)).to be_a_new(Todo)
    end

    it "renders the new template" do
      expect(response).to render_template("new")
    end
  end

  describe "POST :create" do
    it "creates a todo" do
      todo = FactoryGirl.create(:todo)
      post :create, params:{todo:{title: todo.title,status:todo.status}}
      response.code.should == '302'
      response.body.include?('You are being <a href=\"http://test.host/todos\">redirected</a>.')
    end
  end

  describe "GET edit" do
    before { get :edit, params:{id: todo.id} }

    it "initializes @todo to the selected todo to edit" do
      expect(assigns(:todo)).to eq(todo)
    end

    it "renders the edit template" do
      expect(response).to render_template("edit")
    end
  end

  describe "PUT :update" do
    it "updates an exisitng todo" do
      todo = FactoryGirl.create(:todo)
      todo.title = 'update todo title'
      todo.status = 1
      todo.save
      put :update, params:{id: todo.id, todo:{title: todo.title,status:todo.status}}
      response.code.should == "302"
    end
  end

  describe "DELETE :destroy" do
    it "deletes the todo" do
      delete :destroy, params:{ id: todo.id }
      response.code.should == "302"
      expect{Todo.find(todo.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end

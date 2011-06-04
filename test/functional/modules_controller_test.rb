require 'test_helper'

class ModulesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Module.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Module.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Module.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to module_url(assigns(:module))
  end

  def test_edit
    get :edit, :id => Module.first
    assert_template 'edit'
  end

  def test_update_invalid
    Module.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Module.first
    assert_template 'edit'
  end

  def test_update_valid
    Module.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Module.first
    assert_redirected_to module_url(assigns(:module))
  end

  def test_destroy
    module = Module.first
    delete :destroy, :id => module
    assert_redirected_to modules_url
    assert !Module.exists?(module.id)
  end
end

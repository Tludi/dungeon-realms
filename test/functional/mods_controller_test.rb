require 'test_helper'

class ModsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Mod.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Mod.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Mod.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to mod_url(assigns(:mod))
  end

  def test_edit
    get :edit, :id => Mod.first
    assert_template 'edit'
  end

  def test_update_invalid
    Mod.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Mod.first
    assert_template 'edit'
  end

  def test_update_valid
    Mod.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Mod.first
    assert_redirected_to mod_url(assigns(:mod))
  end

  def test_destroy
    mod = Mod.first
    delete :destroy, :id => mod
    assert_redirected_to mods_url
    assert !Mod.exists?(mod.id)
  end
end

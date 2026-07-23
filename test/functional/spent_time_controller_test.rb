require_relative '../test_helper'

class SpentTimeControllerTest < Redmine::ControllerTest
  include Redmine::I18n

  def setup
    super
    Setting.default_language = 'en'
    @request.session[:user_id] = 1
  end

  def test_index
    get :index
    assert_response :success
  end

  def test_index_with_period
    get :index, params: { period: '30_days' }
    assert_response :success
  end

  def test_index_with_all_period
    get :index, params: { period: 'all', period_type: '1' }
    assert_response :success
  end

  def test_report
    get :index
    post :report, params: { user: 2, from: (Date.today - 7).to_s, to: Date.today.to_s }, xhr: true
    assert_response :success
  end
end

# #
#  RSpec Matchers  -  nofxx 2008
#
#
module Xmatchers

  # #
  # Simple Matcher
  #
  def be_sorted
    simple_matcher("a sorted list") { |atual| atual.sort == atual }
  end

  # #
  # Extended
  #
  class BeInZone
    def initialize(expected)
      @expected = expected
    end
    def matches?(target)
      @target = target
      @target.current_zone.eql?(Zone.new(@expected))
    end
    def failure_message
      "expected #{@target.inspect} to be in Zone #{@expected}"
    end
    def negative_failure_message
      "expected #{@target.inspect} not to be in Zone #{@expected}"
    end
  end

  def be_in_zone(expected)
    BeInZone.new(expected)
  end

  # #
  # Autho
  def autho_login_as(user)
    @current_user = mock_model(User)
    User.should_receive(:find_by_id).any_number_of_times.and_return(@current_user)
    #@current_user.stub!(:time_zone).and_return('Brasilia')
    @current_user.stub!(:login).and_return("root")
    request.session[:user] = @current_user
    request.session[:current_user] = @current_user
    controller.stub!(:current_user).and_return(@current_user)
  end


end

# #
# SPEC.OPTS
#--format profile
#--format specdoc
#--format progress
#--reverse
#--diff



#
# #RSpec testing all actions of a controller
# #Posted by Jim Morris
# #http://blog.wolfman.com/articles/2007/07/28/rspec-testing-all-actions-of-a-controller
# module MySpecHelper
#
#   # get all actions for specified controller
#   #dont pluralize
#   def get_all_actions(cont)
#     c= Module.const_get(cont.to_s.camelcase + "Controller")
#     c.public_instance_methods(false).reject{ |action| ['rescue_action'].include?(action) }
#   end
#
#   # test actions fail if not logged in
#   # opts[:exclude] contains an array of actions to skip
#   # opts[:include] contains an array of actions to add to the test in addition
#   # to any found by get_all_actions
#   def controller_actions_should_fail_if_not_logged_in(cont, opts={})
#     except= opts[:except] || []
#     actions_to_test= get_all_actions(cont).reject{ |a| except.include?(a) }
#     actions_to_test =  actions_to_test.reject { |a| opts[:include].include?(a) }
#     actions_to_test.each do |a|
#       #puts "... #{a}"
#       get a
#       response.should_not be_success
#       response.should redirect_to("http://test.host/session/new")
#       flash[:warning].should == @login_warning
#     end
#   end
# end

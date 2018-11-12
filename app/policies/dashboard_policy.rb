class DashboardPolicy < Struct.new(:user, :dashboard)
  def show?
    !user.nil?
  end
end

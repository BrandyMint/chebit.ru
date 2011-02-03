class WelcomeController < ApplicationController
  def index
    @tags = User.tag_counts
    # %w=[Ruby PHP Jave Servlet ASP.NET Perl Flash Flex MySQL postgresql JavaScript AJAX HTML5 xHTML CSS Apache ngnix Linux TDD/BDD rspec cucumber]
  end

end

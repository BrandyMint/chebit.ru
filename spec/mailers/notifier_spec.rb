require "spec_helper"

describe Notifier do
  describe "new_user" do
    let(:mail) { Notifier.new_user }

    it "renders the headers" do
      mail.subject.should eq("New user")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end

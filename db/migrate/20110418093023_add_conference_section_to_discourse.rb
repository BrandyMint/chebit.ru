class AddConferenceSectionToDiscourse < ActiveRecord::Migration
  def self.up
    add_column :discourses, :conference_section_id, :integer

    Discourse.all.each do |discourse|
      next unless discourse.conference_id
      discourse.update_attribute :conference_section, ConferenceSection.find_by_section_id_and_conference_id(discourse.section_id, discourse.conference_id)
    end

    remove_column :discourses, :conference_id
  end

  def self.down
    add_column :discourses, :conference_id

    Discourse.all.each do |discourse|
      next unless discourse.conference_section
      discourse.update_attribute :conference_id, discourse.conference_section.conference_id
    end

    remove_column :discourses, :conference_section_id
  end
end

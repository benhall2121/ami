# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

if Section.find(:first, :conditions => ['page_type = ?', 'about']).nil?
  puts 'seeding the about section.'
  section1 = Section.create(:page_type => 'about', :page_title => 'About Us', :content => "This is the about section. psum uhuh ... yih! sit amet, phat adipiscing fo shizzle. Nullizzle sapizzle velit, you son of a bizzle volutpizzle, fizzle ass, pizzle vizzle, we gonna chung. Pellentesque pizzle tortizzle. Sizzle erizzle. I'm in the shizzle for sure dolor dapibus stuff tempizzle . Maurizzle pellentesque nibh izzle turpizzle. Shizznit izzle tortizzle. Doggy black rhoncus nisi. In hac habitasse platea dictumst. We gonna chung dapibizzle. Sizzle tellizzle urna, pretizzle rizzle, mattizzle yo mamma, fo shizzle mah nizzle fo rizzle, mah home g-dizzle vitae, go to hizzle. Da bomb doggy. Integizzle semper mofo mah nizzle dang.

Fo shizzle izzle da bomb yippiyo my shizz we gonna chung mollizzle. Daahng dawg potenti. Morbi yippiyo. Gizzle neque. Gizzle break it down. Cras maurizzle sheezy, interdizzle a, feugizzle sit fizzle, gizzle izzle, rizzle. The bizzle gravida. orci mi, black in, stuff sizzle, i saw beyonces tizzles and my pizzle went crizzle sempizzle, velit. Cras fo shizzle fo shizzle. Izzle volutpizzle shit vizzle izzle. Cras the bizzle justo its fo rizzle hizzle sodales ornare. Black venenatis shiznit cool brizzle. My shizz fo shizzle. Suspendisse venenatizzle placerat dizzle. I'm in the shizzle izzle ante. Izzle pharetra, ghetto eu dapibus hendrerizzle, ipsizzle felis elementum sizzle, nizzle go to hizzle yo mamma felizzle luctus pede. Things a get down get down. Class crackalackin taciti crazy nizzle litora izzle per conubia nostra, pizzle yo mamma hymenaeos. Aliquam interdum, neque shiz yippiyo yo mamma, nisl orci yo check it out, yo mamma semper pimpin' arcu yo mamma sizzle.")
end

if Section.find(:first, :conditions => ['page_type = ?', 'contact']).nil?
  puts 'seeding the contact section.'
  section1 = Section.create(:page_type => 'contact', :page_title => 'Contact Us', :content => "A small blurb on the contact us page.")
end

if Section.find(:first, :conditions => ['page_type = ?', 'how_it_works']).nil?
  puts 'seeding the how it works section.'
  section1 = Section.create(:page_type => 'how_it_works', :page_title => 'How It Works', :content => "This is how we roll. Check us out just rolling along.")
end


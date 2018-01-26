require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#chat_link' do
    it 'returns the chat url' do
      expect(chat_link).to eq('https://gitter.im/TheOdinProject/theodinproject')
    end
  end

  describe 'title' do
    it 'sets the title' do
      helper.title('Courses')
      expect(helper.content_for(:title)).to eql('Courses | The Odin Project')
    end

    context 'when there is no input' do
      it 'returns nil' do
        expect(title).to be nil
      end
    end
  end

  describe '#bootstrap_class_for' do
    let(:flash_type) { 'alert' }

    it 'returns the bootstrap alert class' do
      expect(helper.bootstrap_class_for(flash_type)).to eql('alert-danger')
    end

    context 'when flash type is notice' do
      let(:flash_type) { 'notice' }

      it 'returns the bootstrap success class' do
        expect(helper.bootstrap_class_for(flash_type)).to eql('alert-success')
      end
    end

    context 'when custom flash type' do
      let(:flash_type) { 'error' }

      it 'returns the bootstrap success class' do
        expect(helper.bootstrap_class_for(flash_type)).to eql('alert-error')
      end
    end
  end

  describe '#active_class' do
    let(:path) { '/courses' }

    context 'when the current page matches the path' do
      before do
        allow(helper).to receive(:current_page?).with(path).and_return(true)
      end

      it 'returns active' do
        expect(helper.active_class(path)).to eql('active')
      end
    end

    context 'when the current page does not match the path' do
      before do
        allow(helper).to receive(:current_page?).with(path).and_return(false)
      end

      it 'returns nil' do
        expect(helper.active_class(path)).to be(nil)
      end
    end
  end

  describe '#first_four_success_stories' do
    it 'returns the first four success stories' do
      expect(SuccessStory).to receive(:limit).with(4)
      helper.first_four_success_stories
    end
  end

  describe '#percentage_completed_by_user' do

    let(:course) { double('Course') }
    let(:user) { double('User') }

    before do
      allow(CourseProgress).to receive(:percentage_completed_by_user).
        with(course, user).and_return(50)
    end

    it 'returns 50' do
      expect(helper.percentage_completed_by_user(course, user)).to eql(50)
    end
  end

  describe '#course_started_by_user' do

    let(:course) { double('Course') }
    let(:user) { double('User') }

    before do
      allow(CourseProgress).to receive(:course_started?).
        with(course, user).and_return(true)
    end

    it 'returns 50' do
      expect(helper.course_started_by_user?(course, user)).to eql(true)
    end
  end

  describe '#course_completed_by_user?' do
    let(:course) { double('Course') }
    let(:user) { double('User') }

    before do
      allow(CourseProgress).to receive(:course_completed?).
        with(course, user).and_return(true)
    end

    it 'returns true' do
      expect(helper.course_completed_by_user?(course, user)).to eql(true)
    end
  end

  describe '#next_lesson_to_complete' do

    let(:course) { double('Course') }
    let(:lesson_completions) { }
    let(:lesson_completion) { double('LessonCompletion') }
    let(:next_lesson) {
      double('NextLesson', to_complete: lesson_to_complete )
    }
    let(:lesson_to_complete) { double('Lesson') }

    before do
      allow(NextLesson).to receive(:new).
        with(course, lesson_completions).and_return(next_lesson)
    end

    it 'returns the next lesson the user has to complete' do
      expect(helper.next_lesson_to_complete(course, lesson_completions)).
        to eql(lesson_to_complete)
    end
  end

  describe '#modifier_for_badge' do
    subject(:modifier_for_badge) { helper.modifier_for_badge(course, user) }

    let(:course) { double('Course') }
    let(:user) { double('User') }
    let(:course_completed) { true }

    before do
      allow(CourseProgress).to receive(:course_completed?).
        with(course, user).and_return(course_completed)
    end

    it 'returns the course completed modifier for the course badge' do
      expect(modifier_for_badge).to eql('progress-circle--completed')
    end

    context 'when the user has not completed the course' do
      let(:course_completed) { false }

      it 'returns the course show progress modifier for the course badge' do
        expect(modifier_for_badge).to eql('progress-circle--show-progress')
      end
    end
  end
end

class Schedule < ApplicationRecord
  validates :title, presence: true
  validates :title, length: {in: 1..20}

  validates :start_date, presence: true
  validates :end_date,
  comparison: { greater_than_or_equal_to: Proc.new { Date.today } }


  validate :memo_length

  def memo_length
    memo_for_validation = memo.gsub(/[\r\n]/,"")
    if memo_for_validation.length > 500
      errors.add(:memo, "Please enter within 500 characters")
    end
  end
end

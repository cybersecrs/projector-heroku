class Project < ApplicationRecord

  belongs_to :user

  validates :naziv, :opis, :do_sada, :ukupno, :aktivan, :user_id, presence: true

  validates :naziv,   length: { maximum: 15,   too_long: "Predugacak naziv! Maksimalan broj slova je [%{count}]." }
  validates :opis,    length: { maximum: 200, too_long: "Predugacak opis! Maksimalan broj slova je [%{count}]." }
  validates :ukupno,  length: { maximum: 7 }
  validates :do_sada, length: { maximum: 7 }

end

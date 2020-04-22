class User < ApplicationRecord
  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  has_many :events, foreign_key: 'creator_id', inverse_of: 'creator'
  has_many :invitations, foreign_key: 'attendee_id'
  has_many :attended_events, through: :invitations
  # == Validations ==========================================================
  has_secure_password
  # == Scopes ===============================================================
  
  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end

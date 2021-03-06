defmodule ParticipateApi.Factory do
  use ExMachina.Ecto, repo: ParticipateApi.Repo
  
  def account_factory do
    %ParticipateApi.Account{
      email: sequence(:email, &"email-#{&1}@example.com"),
      facebook_uid: sequence("facebookuid"),
      participant: build(:participant)
    }
  end

  def participant_factory do
    %ParticipateApi.Participant{
      name: sequence("Participant name")
    }
  end

  def proposal_factory do
    %ParticipateApi.Proposal{
      title: sequence("Proposal title"),
      body: sequence("Proposal body"),
      author: build(:participant)
    }
  end

  def support_factory do
    %ParticipateApi.Support{
      author: build(:participant),
      proposal: build(:proposal)
    }
  end
end

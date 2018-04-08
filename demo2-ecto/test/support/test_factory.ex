defmodule DemoTest.Factory do
  use ExMachina.Ecto, repo: Demo.Repo

  alias Demo.Agenda.Talk

  def talk_factory do
    %Talk{
      title: Faker.Lorem.sentence(10..12),
      description: Faker.Lorem.sentence(40..50),
      speaker: "#{Faker.Name.first_name()} #{Faker.Name.last_name()}",
      handle: "@#{Faker.Internet.user_name()}",
      starts_at: random_datetime()
    }
  end

  defp random_datetime do
    DateTime.utc_now()
    |> Timex.add(Timex.Duration.from_hours(:rand.uniform(24*7)))
  end
end

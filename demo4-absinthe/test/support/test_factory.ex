defmodule DemoTest.Factory do
  use ExMachina.Ecto, repo: Demo.Repo

  alias Demo.Agenda.{Speaker, Talk}

  def speaker_factory do
    %Speaker{
      name: "#{Faker.Name.first_name()} #{Faker.Name.last_name()}",
      handle: "@#{Faker.Internet.user_name()}",
      email: Faker.Internet.email()
    }
  end

  def talk_factory do
    %Talk{
      title: Faker.Lorem.sentence(10..12),
      description: Faker.Lorem.sentence(40..50),
      speaker: insert(:speaker),
      starts_at: random_datetime()
    }
  end

  def random_datetime(hours \\ 24 * 7) do
    DateTime.utc_now()
    |> Timex.add(Timex.Duration.from_hours(:rand.uniform(hours)))
  end
end

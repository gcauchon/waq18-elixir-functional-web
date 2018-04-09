alias Demo.Repo
alias Demo.Agenda.{Speaker, Talk}

speakers = [
  %{
    name: "Guillaume Cauchon",
    handle: "@gcauchon",
    email: "gcauchon@mirego.com",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  },
  %{
    name: "Rémi Prévost",
    handle: "@remi",
    email: "rprevost@mirego.com",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  },
  %{
    name: "Olivier Augin",
    email: "oaubin@mirego.com",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  }
]

Enum.each(speakers, fn(person) ->
  %Speaker{}
  |> Speaker.changeset(person)
  |> Repo.insert()
end)

talks = [
  %{
    title: "Web “fonctionnel” et outils de développement",
    description: "Mirego innove par ses réalisations, mais aussi par l’adoption rapide de technologies qui permettent à 
      l’équipe d’être efficace et motivée. Depuis plusieurs mois, nous avons fait le pari que les languages 
      fonctionnels et les communautés Open Source qui les entourent sont les outils idéaux pour livrer avec
      succès de nombreux projets clients basés sur des backends Elixir ou Clojure.",
    speaker_id: 1,  
    starts_at: ~N[2018-04-10 15:00:00],
  },
  %{
    title: "Constance et qualité du code dans une équipe",
    description: "Depuis plusieurs années, chez Mirego, nous recherchons constamment l’équilibre parfait entre la qualité des 
      produits que nous bâtissons et celle du code qui les propulse. Le *linting* nous aide à atteindre cette 
      combinaison avec des outils tels que `eslint`, `stylelint`, `prettier`, `mix format`, etc. Dans cette présentation, 
      nous explorerons les possibilités qu’offrent ces outils et techniques de *linting* au sein d’une équipe, et 
      ce, pour livrer du code de meilleure qualité. Nous aborderons ensuite les côtés moins connus de ces outils : 
      leurs fonctionnements internes et leur extensibilité qui permettent de développer ses propres règles.",
    speaker_id: 2,  
    starts_at: ~N[2018-04-11 10:15:00],
  },
  %{
    title: "Promouvoir une communication ouverte entre développeurs et designers",
    description: "Chez Mirego, nous cherchons constamment à améliorer les processus de travail entre les équipes de design et de
      développement. Le “QA Design” permet donc aux designers d’être présents tout au long du développement d’un produit. 
      Dans cette présentation, nous utiliserons Zeplin et GitHub afin de définir un processus tout simple de travail qui
      permettra aux équipes de s’attarder à la qualité du produit et ainsi éviter les “back and forth” en cours 
      de développement.",
    speaker_id: 3,  
    starts_at: ~N[2018-04-12 10:15:00],
  }]

Enum.each(talks, fn(talk) ->
  %Talk{}
  |> Talk.changeset(talk)
  |> Repo.insert()
end)

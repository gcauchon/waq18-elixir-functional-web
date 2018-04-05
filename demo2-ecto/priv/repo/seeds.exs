alias SimpleEcto.{Repo, Agenda}

gcauchon = %Agenda{
  title: "Web “fonctionnel” et outils de développement",
  description: "Mirego innove par ses réalisations, mais aussi par l’adoption rapide de technologies qui permettent à l’équipe d’être efficace et motivée. Depuis plusieurs mois, nous avons fait le pari que les languages fonctionnels et les communautés Open Source qui les entourent sont les outils idéaux pour livrer avec succès de nombreux projets clients basés sur des backends Elixir ou Clojure.",
  speaker: "@gcauchon",  
  starts_at: ~N[2018-04-10 15:00:00],
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
}

Repo.insert(gcauchon)


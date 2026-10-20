// Team planning decisions under assignment [01], sections 1.2 and 1.3.
// Integers are hundredths of MD; 1 MD = 8 h is our planning convention.
// The chapter tables and assertions use this single source of numeric data.
#let sum(values) = values.fold(0, (total, value) => total + value)
#let md(value) = str(value / 100).replace(".", ",")
#let budget = (
  (id: "tm", role: [Test Manager], fte: 30, days: 15,
    work: (135, 135, 135), reserve: (15, 15, 15)),
  (id: "ta1", role: [Test Analyst 1], fte: 100, days: 15,
    work: (450, 450, 450), reserve: (50, 50, 50)),
  (id: "ta2", role: [Test Analyst 2], fte: 100, days: 15,
    work: (450, 450, 450), reserve: (50, 50, 50)),
  (id: "dev", role: [Vývoj spolu], fte: 30, days: 15,
    work: (135, 135, 135), reserve: (15, 15, 15)),
  (id: "po", role: [Product Owner], fte: 10, days: 15,
    work: (45, 45, 45), reserve: (5, 5, 5)),
  (id: "uat", role: [Zástupca správcu], fte: 10, days: 5,
    work: (0, 0, 45), reserve: (0, 0, 5)),
)

// Column order: TA1/S1, TA2/S1, TA1/S2, TA2/S2, TA1/S3, TA2/S3.
#let activities = (
  (name: [Plánovanie, analýza a návrh], values: (150, 100, 100, 75, 75, 50)),
  (name: [Dáta a implementácia testov], values: (50, 100, 50, 75, 25, 50)),
  (name: [Systémové a akceptačné overenie], values: (90, 80, 150, 125, 125, 150)),
  (name: [Retesty a regresia], values: (110, 120, 100, 125, 175, 150)),
  (name: [Triage, koordinácia a reporting], values: (50, 50, 50, 50, 50, 50)),
)

#let uat-days = (
  (day: 11, preparation: 5, execution: 0, reserve: 5),
  (day: 12, preparation: 10, execution: 0, reserve: 0),
  (day: 13, preparation: 0, execution: 10, reserve: 0),
  (day: 14, preparation: 0, execution: 10, reserve: 0),
  (day: 15, preparation: 0, execution: 10, reserve: 0),
)

#let validate-plan(roles: budget, tasks: activities, uat: uat-days) = {
  for role in roles {
    assert(role.work.len() == 3 and role.reserve.len() == 3)
    assert(sum(role.work) + sum(role.reserve) == role.fte * role.days,
      message: "Role budget must include reserve and equal availability: " + role.id)
    for sprint in range(3) {
      let available = if role.id == "uat" and sprint < 2 { 0 } else { 5 * role.fte }
      assert(role.work.at(sprint) >= 0 and role.reserve.at(sprint) >= 0)
      assert(role.work.at(sprint) + role.reserve.at(sprint) <= available,
        message: "Sprint capacity exceeded: " + role.id)
    }
  }
  for column in range(6) {
    let role = roles.find(r => r.id == if calc.even(column) { "ta1" } else { "ta2" })
    assert(sum(tasks.map(a => a.values.at(column))) == role.work.at(calc.floor(column / 2)),
      message: "Analyst activities disagree with role budget")
    assert(tasks.all(a => a.values.at(column) >= 0))
  }
  assert(uat.map(d => d.day) == (11, 12, 13, 14, 15))
  let role = roles.find(r => r.id == "uat")
  for day in uat {
    assert(day.preparation >= 0 and day.execution >= 0 and day.reserve >= 0)
    assert(day.preparation + day.execution + day.reserve <= role.fte,
      message: "Daily UAT representative capacity exceeded")
    assert(day.execution == 0 or (day.day >= 13 and day.day <= 15),
      message: "Formal UAT is only available on D13-D15")
  }
  assert(sum(uat.map(d => d.preparation + d.execution)) == sum(role.work))
  assert(sum(uat.map(d => d.reserve)) == sum(role.reserve))
  true
}

#assert(validate-plan())

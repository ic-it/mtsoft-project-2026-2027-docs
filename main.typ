// From this directory: typst compile main.typ build/MTSOFT.pdf
// Content is manually maintained in chapters/. No import/conversion step.
#import "template.typ": project, cover
#show: project

#cover()
#outline(title: [Obsah], depth: 2)
#pagebreak()

#include "chapters/01-context.typ"
#pagebreak()
#include "chapters/02-organisation.typ"
#include "chapters/03-stories.typ"
#pagebreak()
#include "chapters/04-quality.typ"
#pagebreak()
#include "chapters/05-traceability.typ"
#pagebreak()
#include "chapters/06-risks.typ"
#pagebreak()
#include "chapters/07-approach.typ"
#include "chapters/08-sprints.typ"
#include "chapters/09-environments.typ"
#include "chapters/10-reporting.typ"
#include "chapters/11-criteria.typ"
#pagebreak()
#include "chapters/references.typ"

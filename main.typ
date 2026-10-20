// Build: typst compile project-1/typst/main.typ project-1/typst/MTSOFT.pdf
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
#include "chapters/references.typ"

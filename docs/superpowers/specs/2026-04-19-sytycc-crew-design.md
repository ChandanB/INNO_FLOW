# SYTYCC Crew Section Design

Goal: make the "Meet the crew" section render consistently in Webflow without relying on inherited `feature-*` rules that vary by host context.

Approach:
- Keep the existing SYTYCC crew content and image assets.
- Add a dedicated `sytycc-crew-*` class layer to the crew section markup.
- Recreate the working dark band, card surfaces, spacing, portrait sizing, and responsive stacking using only those dedicated classes.
- Leave legacy Webflow classes in place for compatibility, but stop depending on them for presentation.

Success criteria:
- The crew section renders like the working GitHub version.
- The section remains readable and dark even if Webflow legacy `feature-*` classes win elsewhere.
- Mobile layout collapses cleanly to stacked cards.

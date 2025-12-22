### Document Structure

**Core Sections:**
- **Overview & Mission**: Defines the plugin's accessibility-first approach aligned with v2.0 parent repository directives
- **Agent Capabilities**: Five key areas of management
- **Workflows**: Four detailed operational procedures
- **Quality & Testing Standards**: Version management and compliance requirements
- **Research Integration**: Scientific backing from parent repository
- **Contribution Guidelines**: PR templates and commit conventions

### Key Features Documented

**Palette Management (Section 1)**:
- Complete Dark Mode palette with reduced saturation (Pink: 60%, Purple: 36%)
- Light Mode specifications for users with dark-interface discomfort
- Sepia Mode for extended coding sessions with warm tones
- All modes achieve WCAG AAA compliance (10.26:1, 12.06:1, 11.05:1 contrast ratios)

**Code Structure (Section 2)**:
```
alchemists-orchid.nvim/
├── colors/alchemists-orchid.vim
├── lua/alchemists-orchid/
│   ├── palettes/{dark,light,sepia}.lua
│   ├── highlights.lua
│   └── terminal.lua
└── AGENTS.md
```

**Highlight Coverage (Section 3)**:
- Core editor groups (Normal, Cursor, Visual, Search)
- LSP diagnostics (Error, Warn, Info, Hint)
- Tree-sitter syntax groups
- Popular plugins (Telescope, NvimTree, GitSigns, Lualine)

**Accessibility Validation (Section 4)**:
- WCAG AA minimum (4.5:1 contrast)
- Halation prevention (60% saturation cap in dark mode)
- Color blindness testing requirements
- Automated compliance checks

**API Configuration (Section 5)**:
```lua
require('alchemists-orchid').setup({
  mode = 'dark',  -- 'light', 'sepia'
  overrides = { pink = '#E8A4CC' },
  transparent = false,
  italic_comments = true
})
```

### Operational Workflows

**Workflow 1: Adding New Palette Modes**
- Research → Color Selection → Implementation → Documentation → Validation

**Workflow 2: Updating Existing Colors**
- Impact Analysis → Palette Update → Highlight Cascade → Testing

**Workflow 3: Expanding Plugin Support**
- Discovery → Semantic Mapping → Implementation → Documentation

**Workflow 4: Performance Optimization**
- Profiling → Strategy → Implementation → Benchmarking

### Quality Standards

- **Lua Compatibility**: Neovim 0.8+ (LuaJIT)
- **Load Time**: < 50ms target
- **File Size**: < 100KB footprint
- **Testing**: Manual + Visual regression + Accessibility automation

### Research-Backed Design

**Astigmatism Optimization**:
- Affects ~50% of population
- Halation mitigation through reduced saturation
- Scientific basis from parent repository research

**Color Psychology**:
- Pink: Tranquilizing effect, anxiety reduction
- Purple: Decreased amygdala activity
- Blue: Security and calm
- Green: Optimal for human eye processing

### Emergency Protocols

**Critical Issues** (< 4hr response):
- Accessibility violations
- WCAG compliance failures
- Severe usability problems

**Breaking Changes**:
- Weekly nightly build testing
- Compatibility branch maintenance
- User communication timelines

### Future Vision

**v2.1 Features**:
- Adaptive brightness based on time
- Customizable saturation controls
- Quick-switch comfort/productivity modes

**v3.0 Roadmap**:
- AI-powered personalization
- Dynamic ML-based palette generation
- Health integration with break reminders

***

## How to Use This File

**For AI Agents**:
1. Reference palette specifications when updating colors
2. Follow workflows for systematic changes
3. Validate against accessibility standards
4. Maintain empathetic, scientific tone

**For Contributors**:
1. Use PR template for submissions
2. Follow commit message conventions
3. Test across all three palette modes
4. Document accessibility considerations

**For Maintainers**:
1. Conduct monthly/quarterly reviews per checklist
2. Respond to critical issues per emergency protocols
3. Track success metrics quantitatively and qualitatively


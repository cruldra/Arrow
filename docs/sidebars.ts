import type {SidebarsConfig} from '@docusaurus/plugin-content-docs';

const sidebars: SidebarsConfig = {
  tutorialSidebar: [
    'intro',
    {
      type: 'category',
      label: '入门指南',
      items: [
        'getting-started/quick-start',
        'getting-started/shortcuts',
        'getting-started/navigation-plot',
        'getting-started/variables-logic',
        'getting-started/characters',
        'getting-started/project-organization',
      ],
    },
    {
      type: 'category',
      label: '技术文档',
      items: [
        'technical/build-from-source',
        'technical/cli-arguments',
        'technical/project-data-structure',
      ],
    },
    {
      type: 'category',
      label: '内置节点',
      items: [
        'nodes/condition',
        'nodes/content',
        'nodes/dialog',
        'nodes/entry',
        'nodes/frame',
        'nodes/generator',
        'nodes/hub',
        'nodes/interaction',
        'nodes/jump',
        'nodes/macro-use',
        'nodes/marker',
        'nodes/monolog',
        'nodes/randomizer',
        'nodes/sequencer',
        'nodes/tag-edit',
        'nodes/tag-match',
        'nodes/tag-pass',
        'nodes/user-input',
        'nodes/variable-update',
      ],
    },
  ],
};

export default sidebars;

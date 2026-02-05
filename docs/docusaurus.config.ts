import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

const config: Config = {
  title: 'Arrow 文档',
  tagline: '一个用于创建非线性交互式叙事的开源工具',
  favicon: 'img/favicon.ico',

  // 设置你的网站生产环境 URL
  url: 'https://mhgolkar.github.io',
  // 设置网站的 base pathname
  baseUrl: '/Arrow/',

  // GitHub pages 部署配置
  organizationName: 'cruldra',
  projectName: 'Arrow',

  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',

  // 即使不使用国际化，也可以使用此字段设置有用的元数据
  i18n: {
    defaultLocale: 'zh-Hans',
    locales: ['zh-Hans'],
  },

  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: './sidebars.ts',
          editUrl:
            'https://github.com/mhgolkar/Arrow/tree/main/docs/',
        },
        blog: false,
        theme: {
          customCss: './src/css/custom.css',
        },
      } satisfies Preset.Options,
    ],
  ],

  themeConfig: {
    // 社交卡片图片
    image: 'img/docusaurus-social-card.jpg',
    navbar: {
      title: 'Arrow',
      logo: {
        alt: 'Arrow Logo',
        src: 'img/logo.svg',
        href: '/Arrow/docs/',
      },
      items: [
        {
          type: 'docSidebar',
          sidebarId: 'tutorialSidebar',
          position: 'left',
          label: '文档',
        },
        {
          href: 'https://github.com/mhgolkar/Arrow',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: '文档',
          items: [
            {
              label: '快速入门',
              to: '/docs/getting-started/quick-start',
            },
          ],
        },
        {
          title: '社区',
          items: [
            {
              label: 'GitHub Issues',
              href: 'https://github.com/mhgolkar/Arrow/issues',
            },
            {
              label: 'GitHub Discussions',
              href: 'https://github.com/mhgolkar/Arrow/discussions',
            },
          ],
        },
        {
          title: '更多',
          items: [
            {
              label: 'GitHub',
              href: 'https://github.com/mhgolkar/Arrow',
            },
            {
              label: '在线体验',
              href: 'https://mhgolkar.github.io/Arrow/',
            },
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} Arrow Project. Built with Docusaurus.`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
      additionalLanguages: ['gdscript', 'json', 'bash'],
    },
  } satisfies Preset.ThemeConfig,
};

export default config;

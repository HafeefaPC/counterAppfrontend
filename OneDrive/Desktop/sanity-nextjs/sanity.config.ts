import { defineConfig } from 'sanity'
import { structureTool } from 'sanity/structure'

import { schemaTypes } from './schemas'

export default defineConfig({
  name: 'default',
  title: 'sanity-nextjs',

  projectId: 'bkaoh76m',
  dataset: 'production',
  basePath: "/studio",
  plugins: [structureTool()],

  schema: {
    types: schemaTypes,
  },
})

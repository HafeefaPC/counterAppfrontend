import { visionTool } from '@sanity/vision';
import { defineConfig } from 'sanity';
import { structureTool } from 'sanity/structure';

import { apiVersion, dataset, projectId } from './sanity/env';
import { schema } from './sanity/schema';

export default defineConfig({
  basePath: '/studio',
  projectId: "4dr6iqb9",
  dataset: "production",
  schema: schema,
  plugins: [
    structureTool(),
    visionTool({ defaultApiVersion: apiVersion }),
  ],
});
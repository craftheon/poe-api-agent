import { buildConfig } from "payload";
import sharp from "sharp";
import { mongooseAdapter } from "@payloadcms/db-mongodb"; // database-adapter-import

export default buildConfig({
  db: mongooseAdapter({
    url: process.env.DATABASE_URI,
  }),
  secret: process.env.PAYLOAD_SECRET,
  sharp,
});

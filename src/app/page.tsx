import { getPayload } from "payload";
import configPromise from "@payload-config";

export default async function Home() {
  const payload = await getPayload({ config: configPromise });

  const users = await payload.find({
    collection: "users",
  });

  return (
    <main>
      <div>Users</div>
      <ul>
        {users.docs.map((user) => (
          <li key={user.id}>{user.email}</li>
        ))}
      </ul>
    </main>
  );
}

import { redirect } from '@sveltejs/kit';
import type { LayoutServerLoad } from './$types';

export const load: LayoutServerLoad = async (event) => {
	const session = await event.locals.auth();

	if (!session?.user?.name) {
		if (event.url.pathname !== '/login') {
			throw redirect(303, `/login`);
		}
	}

	return {
		session
	};
};

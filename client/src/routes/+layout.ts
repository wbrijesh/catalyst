import type { LayoutLoad } from './$types';

const nonDashboardRoutes = ['/login'];

export const load: LayoutLoad = ({ url }) => {
	const showSidebar = !nonDashboardRoutes.some((route) => url.pathname.startsWith(route));

	return {
		showSidebar
	};
};

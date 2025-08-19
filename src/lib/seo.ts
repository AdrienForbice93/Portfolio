import { NextSeo } from 'next-seo';
import { useRouter } from 'next/router';

import type { ComponentProps } from 'react';

export function useSeoProps(
	props: Partial<ComponentProps<typeof NextSeo>> = {},
): Partial<ComponentProps<typeof NextSeo>> {
	const router = useRouter();

	const title = 'Adrien ─ développeur';
	const description = "Hey 👋 Je suis Adrien, développeur";

	return {
		title,
		description,
		canonical: `https://adrien.dev/${router.asPath}`,
		openGraph: {
			title,
			description,
			site_name: 'adrien',
			url: `https://adrien.dev/${router.asPath}`,
			type: 'website',
			images: [
				{
					url: 'https://adrien.dev/banner.png',
					alt: description,
					width: 1280,
					height: 720,
				},
			],
		},
		twitter: {
			cardType: 'summary_large_image',
			handle: '@adriendev',
			site: '@adriendev',
		},
		...props,
	};
}

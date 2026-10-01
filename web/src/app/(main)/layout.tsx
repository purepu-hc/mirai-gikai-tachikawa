import { GoogleAnalytics } from "@next/third-parties/google";
import { SpeedInsights } from "@vercel/speed-insights/next";
import type { ReactNode } from "react";
import { Header } from "@/components/header";
import { AuthGate } from "@/components/layouts/auth-gate";
import { Footer } from "@/components/layouts/footer/footer";
import { MainLayout } from "@/components/layouts/main-layout";
import { siteConfig } from "@/config/site.config";
import { resolveGaTrackingId } from "@/lib/analytics";
import { env } from "@/lib/env";
import { needsAnonymousAuth } from "@/lib/feature-flags";
import { RubyfulInitializer } from "@/lib/rubyful";

export default function MainGroupLayout({
  children,
}: Readonly<{
  children: ReactNode;
}>) {
  const gaId = resolveGaTrackingId(
    siteConfig.features.googleAnalytics,
    env.analytics.gaTrackingId
  );

  return (
    <>
      <SpeedInsights />
      {gaId && <GoogleAnalytics gaId={gaId} />}
      <RubyfulInitializer />
      {needsAnonymousAuth(siteConfig.features) && <AuthGate />}

      <MainLayout>
        <Header />
        <main className="min-h-dvh md:min-h-[calc(100dvh-96px)] bg-mirai-surface">
          {children}
        </main>
        <Footer />
      </MainLayout>
    </>
  );
}
